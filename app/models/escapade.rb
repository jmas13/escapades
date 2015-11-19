class Escapade < ActiveRecord::Base
  belongs_to :user
  has_many :responses, dependent: :destroy
  has_many :commits, dependent: :destroy
  validates :title, presence: true
  validates :start_date, :end_date, :status, presence: true
  validates :status, inclusion: ["idea", "event", "archive"]

  def format_start_date
    self.start_date.strftime('%B %-d, %Y')
  end

  def format_end_date
    self.end_date.strftime('%B %-d, %Y')
  end

end
