class StarticPagesController < ApplicationController

  # ROOT page
  def index
    start_time_interval = 12.hours.ago
    @house_data = Temperature.where('sensor = "house" and created_at > ?', start_time_interval)
                             .pluck(:created_at, :data)
    @bath_data = Temperature.where('sensor = "banya" and created_at > ?', start_time_interval)
                            .pluck(:created_at, :data)

    @data = [{name: 'Дом', data: @house_data, color: 'red'},
             { name: 'Баня', data: @bath_data, color: 'green' }
    ]

  end
end
