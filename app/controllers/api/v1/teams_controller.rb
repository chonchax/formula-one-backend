# frozen_string_literal: true

class Api::V1::TeamsController < ApplicationController
  def index
    page = (params[:page] || 1).to_i

    pagy_teams, teams = pagy(Team.order(:name), page: page, limit: Pagy.options[:items])

    render json: {
      teams: TeamBlueprint.render_as_hash(teams),
      pagy: {
        page: pagy_teams.page,
        per_page: pagy_teams.limit,
        total_pages: pagy_teams.pages,
        total_count: pagy_teams.count
      }
    }, status: :ok
  end
end
