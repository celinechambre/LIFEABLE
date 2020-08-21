class Life < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  has_one_attached :photo

  validates :title, presence: true
  validates :description, presence: true
  validates :city, presence: true
  validates :job, presence: true
  validates :lifestyle, presence: true
end
