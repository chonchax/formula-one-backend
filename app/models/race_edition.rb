class RaceEdition < ApplicationRecord
  belongs_to :race
  has_many :results, dependent: :destroy

  validates :season, uniqueness: { scope: :race_id, message: "edition already exists for this race and season" }
end
