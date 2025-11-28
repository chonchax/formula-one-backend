# frozen_string_literal: true

class ResultBlueprint < Blueprinter::Base
  identifier :id
  fields :position, :points, :best_lap_time

  association :driver, blueprint: DriverBlueprint
  association :team, blueprint: TeamBlueprint
end
