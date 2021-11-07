class Api::V1::WebsitesController < ApplicationController
  def index
    render json: Website.all
  end

  def create
    @website = Website.new(website_params)

    if @website.save
      render json: @website
    else
      render json: { errors: @website.errors.to_hash(true) }, status: :unprocessable_entity
    end
  end

  def destroy
    @website = Website.find(params[:id])
    @website.destroy

    render json: @website
  end

  protected

  def website_params
    params.permit(:title, :url)
  end
end
