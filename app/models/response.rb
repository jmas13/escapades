class Response < ActiveRecord::Base
  belongs_to :user
  belongs_to :escapade
  validates :start_date, :end_date, presence: true
end
