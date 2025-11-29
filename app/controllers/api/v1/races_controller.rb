# frozen_string_literal: true

class Api::V1::RacesController < ApplicationController
  def index
    page = (params[:page] || 1).to_i

    pagy_races, races = pagy(Race.order(:name), page: page, limit: Pagy.options[:items])

    render json: {
      races: RaceBlueprint.render_as_hash(races),
      pagy: {
        page: pagy_races.page,
        per_page: pagy_races.limit,
        total_pages: pagy_races.pages,
        total_count: pagy_races.count
      }
    }, status: :ok
  end
end
