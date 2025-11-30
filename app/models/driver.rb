# frozen_string_literal: true

class Driver < ApplicationRecord
  belongs_to :team
  has_many :results, dependent: :destroy

  validates :first_name, :last_name, :number, presence: true
  validates :number, uniqueness: true
  validates :team, presence: true

  def total_points
    results.sum(:points)
  end

end
