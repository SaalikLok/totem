class Api::V1::WebsitesController < ApplicationController
  def index
    render json: Website.all
  end
end
