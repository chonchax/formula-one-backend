# frozen_string_literal: true

class Api::V1::DriversController < Api::V1::BaseController
  before_action :authenticate_user!, only: [ :create, :update, :destroy ]

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

    ranked = Driver
      .left_joins(:results)
      .select("drivers.*, COALESCE(SUM(results.points),0) AS total_points")
      .group("drivers.id")
      .includes(:team)
      .order(Arel.sql("COALESCE(SUM(results.points),0) DESC"))

    pagy_drivers, drivers = pagy(ranked, page: page, limit: Pagy.options[:items])

    render json: {
      drivers: DriverBlueprint.render_as_hash(drivers, view: :with_points),
      pagy: {
        page: pagy_drivers.page,
        per_page: pagy_drivers.limit,
        total_pages: pagy_drivers.pages,
        total_count: pagy_drivers.count
      }
    }, status: :ok
  end

  def create
    driver = Driver.new(driver_params)

    if driver.save
      render json: DriverBlueprint.render_as_hash(driver), status: :created
    else
      render json: { error: "Unprocessable Entity", messages: driver.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    driver = Driver.find(params[:id])

    if driver.update(driver_params)
      render json: DriverBlueprint.render_as_hash(driver), status: :ok
    else
      render json: { error: "Unprocessable Entity", messages: driver.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    driver = Driver.find(params[:id])
    driver.destroy
    head :no_content
  end

  private

  def driver_params
    params.permit(:first_name, :last_name, :team_id, :nationality, :number, :points)
  end
end
