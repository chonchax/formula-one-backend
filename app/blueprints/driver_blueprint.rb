# frozen_string_literal: true

class DriverBlueprint < Blueprinter::Base
  identifier :id

  fields :first_name, :last_name, :nationality, :number

  view :with_points do
    field :total_points do |driver|
      driver[:total_points].to_i
    end
  end

  association :team, blueprint: TeamBlueprint
end
