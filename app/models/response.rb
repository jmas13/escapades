class Response < ActiveRecord::Base
  belongs_to :user
  belongs_to :escapade
  has_many :availabilities, dependent: :destroy
end
