class Team < ApplicationRecord
  has_many :drivers, dependent: :destroy
  has_many :results, dependent: :destroy
end
