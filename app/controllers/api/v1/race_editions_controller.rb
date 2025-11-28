# frozen_string_literal: true

class Api::V1::RaceEditionsController < ApplicationController
  def index
    page = (params[:page] || 1).to_i

    race = Race.find(params[:race_id])
    pagy_editions, editions = pagy(race.race_editions.order(:season, :race_date), page: , limit: Pagy.options[:items])

    render json: {
      editions: RaceEditionBlueprint.render_as_hash(editions),
      pagy: {
        page: pagy_editions.page,
        per_page: pagy_editions.limit,
        total_pages: pagy_editions.pages,
        total_count: pagy_editions.count
      }
    }, status: :ok
  end

  def results
    edition = RaceEdition.find(params[:id])
    results = edition.results.includes(:driver, :team).order(:position)

    render json: {
      results: ResultBlueprint.render_as_hash(results)
    }, status: :ok
  end
end
