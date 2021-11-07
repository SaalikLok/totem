class Api::V1::VisitsController < ApplicationController
  def show
    render json: Visit.find(params[:id])
  end

  def create
    @visit = Visit.new(visit_params)
    @visit.website = Website.find_by(url: params[:host])

    if @visit.save
      render json: @visit
    else
      render json: { errors: @visit.errors.to_hash(true) }, status: :unprocessable_entity
    end
  end

  protected

  def visit_params
    params.permit(:full_url, :host, :pathname, :referring_host)
  end
end
