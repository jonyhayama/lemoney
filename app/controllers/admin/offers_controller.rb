class Admin::OffersController < AdminController
  
  def index
    @offers = Offer.all
  end
end