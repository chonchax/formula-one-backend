class Team < ApplicationRecord
  has_many :drivers, dependent: :destroy
  has_many :results, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :location, presence: true
end
