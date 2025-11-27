class Race < ApplicationRecord
  has_many :race_editions, dependent: :destroy
end
