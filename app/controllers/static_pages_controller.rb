class StaticPagesController < ApplicationController

  # ROOT page
  def index
    start_time_interval = 12.hours.ago
    @house_data = Temperature.where('sensor = "house" and created_at > ?', start_time_interval)
                              .order(:created_at)
                             .pluck(:created_at, :data)
    @bath_data = Temperature.where('sensor = "banya" and created_at > ?', start_time_interval)
                            .order(:created_at)
                            .pluck(:created_at, :data)

    @data = [{name: 'Дом', data: @house_data, color: '#e79592'},
             { name: 'Баня', data: @bath_data, color: '#6ab8f7' }
    ]

    @last_house_data = Temperature.where(sensor: 'house').order(:created_at).last
    @last_bath_data = Temperature.where(sensor: 'banya').order(:created_at).last

  end
end
