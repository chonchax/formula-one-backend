# frozen_string_literal: true

class Driver < ApplicationRecord
  has_many :results, dependent: :destroy
  belongs_to :team
end
