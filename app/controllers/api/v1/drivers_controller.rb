# frozen_string_literal: true

class Api::V1::DriversController < ApplicationController
  def index
    page = (params[:page] || 1).to_i

    pagy_drivers, drivers = pagy(Driver.includes(:team).order(:last_name), page: page, limit: Pagy.options[:items])

    render json: {
      drivers: DriverBlueprint.render_as_hash(drivers),
      pagy: {
        page: pagy_drivers.page,
        per_page: pagy_drivers.limit,
        total_pages: pagy_drivers.pages,
        total_count: pagy_drivers.count
      }
    }, status: :ok
  end

  def ranking
    page = (params[:page] || 1).to_i

    pagy_drivers, drivers = pagy(Driver.includes(:team).order(points: :desc), page: page, limit: Pagy.options[:items])

    render json: {
      drivers: DriverBlueprint.render_as_hash(drivers),
      pagy: {
        page: pagy_drivers.page,
        per_page: pagy_drivers.limit,
        total_pages: pagy_drivers.pages,
        total_count: pagy_drivers.count
      }
    }, status: :ok
  end
end
