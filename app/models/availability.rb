class Availability < ActiveRecord::Base
  belongs_to :response
  validates :start_date, presence: true
  validates :end_date, presence: true
end
