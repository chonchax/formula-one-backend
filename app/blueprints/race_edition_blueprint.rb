# frozen_string_literal: true

class RaceEditionBlueprint < Blueprinter::Base
  identifier :id
  fields :season, :race_date

  association :race, blueprint: RaceBlueprint
  association :results, blueprint: ResultBlueprint
end
