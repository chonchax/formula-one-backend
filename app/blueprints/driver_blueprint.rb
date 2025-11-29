# frozen_string_literal: true

class DriverBlueprint < Blueprinter::Base
  identifier :id

  fields :first_name, :last_name, :nationality, :number, :points

  association :team, blueprint: TeamBlueprint
end
