class TemperatureController < ApplicationController

  # POST /data/
  def load
    temp = Temperature.new(
        sensor: params['sensor'],
        data: params['data'].to_f,
        data_row: params['data']
      )
    if temp.save
      render json: temp, status: 200
      Temperature.where("created_at < ?", 24.hours.ago).destroy_all
    else
      render json: temp.errors, status: 401
    end

  end
end
