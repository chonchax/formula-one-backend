# frozen_string_literal: true

class ResultBlueprint < Blueprinter::Base
  identifier :id
  fields :position, :points

  association :driver, blueprint: DriverBlueprint
  association :team, blueprint: TeamBlueprint
  association :race_edition, blueprint: RaceEditionBlueprint
end
