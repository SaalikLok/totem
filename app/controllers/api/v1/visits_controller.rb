class Api::V1::VisitsController < ApplicationController
  def show
    render json: Visit.find(params[:id])
  end
end
