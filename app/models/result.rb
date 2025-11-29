class Result < ApplicationRecord
  belongs_to :driver
  belongs_to :team
  belongs_to :race_edition

  validates :position, presence: true, numericality: { greater_than: 0 }
  validates :driver, :team, :race_edition, presence: true
end
