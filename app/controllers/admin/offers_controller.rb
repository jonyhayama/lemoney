class Admin::OffersController < AdminController
  before_action :set_current_offer, only: [:edit, :update, :destroy]
  
  def index
    @offers = Offer.all
  end

  def new
    @offer = Offer.new
  end

  def create
    @offer = Offer.new(offer_params)
    if @offer.save
      redirect_to admin_offers_path
    else 
      render :new
    end
  end

  def edit; end

  def update
    if @offer.update(offer_params)
      redirect_to admin_offers_path
    else 
      render :edit
    end
  end

  def destroy
    @offer.destroy
    redirect_to admin_offers_path
  end

  def set_current_offer
    @offer = Offer.find(params[:id])
  end

  private 

  def offer_params
    params.require(:offer).permit(:name, :url, :description, :starts_at, :ends_at, :premium)
  end
end