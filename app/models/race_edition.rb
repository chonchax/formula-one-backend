class RaceEdition < ApplicationRecord
  has_many :results, dependent: :destroy
  belongs_to :race
end
