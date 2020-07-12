class Application::HomeController < ApplicationController

  def index
    @offers = Offer.enabled.order(premium: :desc, updated_at: :desc)
  end
end