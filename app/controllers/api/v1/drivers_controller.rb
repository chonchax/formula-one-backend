# frozen_string_literal: true

class Api::V1::DriversController < ApplicationController
  def index
    pagy_drivers, drivers = pagy(Driver.includes(:team).order(:last_name), limit: 10)

    render json: {
      drivers: DriverBlueprint.render_as_hash(drivers),
      pagy: {
        page: pagy_drivers.page,
        per_page: pagy_drivers.vars[:limit],
        total_pages: pagy_drivers.pages,
        total_count: pagy_drivers.count
      }
    }
  end
end
