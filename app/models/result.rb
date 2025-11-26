class Result < ApplicationRecord
  belongs_to :driver
  belongs_to :team
  belongs_to :race_edition
end
