# frozen_string_literal: true

module Results
  class CreateResult
    attr_accessor :race_edition, :driver_id, :team_id, :position, :points, :best_lap_time

    def initialize(race_edition:, driver_id:, team_id:, position:, points:, best_lap_time:)
      @race_edition = race_edition
      @driver_id = driver_id
      @team_id = team_id
      @position = position
      @points = points
      @best_lap_time = best_lap_time
    end

    def call
      Result.create!(
        race_edition: race_edition,
        driver_id: driver_id,
        team_id: team_id,
        position: position,
        points: points,
        best_lap_time: best_lap_time
      )
    end
  end
end
