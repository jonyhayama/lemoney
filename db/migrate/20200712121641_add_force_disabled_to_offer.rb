class AddForceDisabledToOffer < ActiveRecord::Migration[6.0]
  def change
    add_column :offers, :force_disabled, :boolean, default: false
  end
end
