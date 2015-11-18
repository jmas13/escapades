class Escapade < ActiveRecord::Base
  belongs_to :user
  has_many :responses, dependent: :destroy
  validates :title, presence: true
  validates :start_date, :end_date, :status, presence: true
  validates :status, inclusion: ["idea", "event", "archive"]
end
