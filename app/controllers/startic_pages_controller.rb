class StarticPagesController < ApplicationController

  # ROOT page
  def index
    # @house_last = Temperature.find_by_sensor('house').last
    # @bath_last = Temperature.find_by_sensor('banya').last
    @house_data = []
    @house_data = Temperature.where(sensor: 'house').pluck(:created_at, :data)
    # house_data_all = Temperature.where(sensor: 'house')
    # if house_data_all
    #   house_data_all.each do |temp|
    #     data = {time: temp.created_at, value: temp.data}
    #     @house_data << data
    #   end
    # end
    puts @house_data

    @bath_data = []
    bath_data_all = Temperature.where(sensor: 'banya')
    if bath_data_all
      bath_data_all.each do |temp|
        data = {time: temp.created_at, value: temp.data}
        @bath_data << data
      end
    end

  end
end
