class Api::V1::HealthChecksController < ApplicationController
  def index
    render json: { status: 200 }
  end
end
