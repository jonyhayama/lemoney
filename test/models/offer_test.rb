require 'test_helper'

class OfferTest < ActiveSupport::TestCase
  test "save empty" do
    offer = Offer.new
    assert_not offer.save, 'Saved empty offer'
  end

  test "save without name" do
    offer = offers(:walmart)
    offer.name = nil
    assert_not offer.save, 'Saved offer without name'
  end

  test "save without url" do
    offer = offers(:walmart)
    offer.url = nil
    assert_not offer.save, 'Saved offer without url'
  end

  test "save without invalid url" do
    offer = offers(:walmart)
    offer.url = 'walmart'
    assert_not offer.save, 'Saved offer without url'
  end

  test "save without invalid description" do
    offer = offers(:walmart)
    offer.description = (0...501).map { ('a'..'z').to_a[rand(26)] }.join
    assert_not offer.save, 'Saved offer with invalid description'
  end

  test "save complete offer" do
    offer = offers(:walmart)
    assert offer.save, 'Did not save correct offer'
  end

  test "save with non unique name" do
    offer = offers(:walmart)
    offer.save
    offer = offers(:macys)
    offer.name = 'walmart'
    assert_not offer.save, 'Saved offer with a non unique name'
  end

  test "status enabled without ends_at" do
    offer = Offer.new
    offer.starts_at = Time.now - 1.day
    assert offer.is_enabled?, 'Should be enabled'
  end

  test "status enabled with ends_at" do
    offer = Offer.new
    offer.starts_at = Time.now - 1.day
    offer.ends_at = Time.now + 1.day
    assert offer.is_enabled?, 'Should be enabled'
  end
  
  test "status disabled by starts_at in the future" do
    offer = Offer.new
    offer.starts_at = Time.now + 1.day
    assert_not offer.is_enabled?, 'Should be disabled'
  end

  test "status disabled by ends_at in the past" do
    offer = Offer.new
    offer.starts_at = Time.now - 2.day
    offer.ends_at = Time.now - 1.day
    assert_not offer.is_enabled?, 'Should be disabled'
  end

  test "status disabled by force_disabled" do
    offer = Offer.new
    offer.starts_at = Time.now - 2.day
    offer.ends_at = Time.now + 1.day
    offer.force_disabled = true
    assert_not offer.is_enabled?, 'Should be disabled'
  end
end
