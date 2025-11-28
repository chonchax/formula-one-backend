class RaceEdition < ApplicationRecord
  has_many :results, dependent: :destroy
  belongs_to :race

  validates :season, uniqueness: { scope: :race_id, message: "edition already exists for this race and season" }
end
