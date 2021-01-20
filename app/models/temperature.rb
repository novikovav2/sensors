class Temperature < ApplicationRecord
  validates :sensor, presence: true
  validates :data, presence: true
  validates :data_row, presence: true
end
