class SamplesController < ApplicationController
  def show
    render json: Sample.new(params[:id])
  end
end
