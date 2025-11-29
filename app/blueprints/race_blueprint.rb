# frozen_string_literal: true

class RaceBlueprint < Blueprinter::Base
  identifier :id
  fields :name, :location, :all_time_best_time
end
