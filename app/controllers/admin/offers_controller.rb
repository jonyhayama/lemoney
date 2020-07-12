class Admin::OffersController < AdminController
  
  def index
    @offers = Offer.all
  end

  def new
    @offer = Offer.new
  end

  def create
    @offer = Offer.new(offer_params)
    @offer.save
    redirect_to admin_offers_path
  end

  def edit
    @offer = Offer.find(params[:id])
  end

  def update
    @offer = Offer.find(params[:id])
    @offer.update(offer_params)
    redirect_to admin_offers_path
  end

  private 

  def offer_params
    params.require(:offer).permit(:name, :url, :description, :starts_at, :ends_at)
  end
end