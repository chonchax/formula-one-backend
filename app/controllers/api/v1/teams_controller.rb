# frozen_string_literal: true

class Api::V1::TeamsController < Api::V1::BaseController
  before_action :authenticate_user!, only: [ :create, :update, :destroy ]

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

  def create
    team = Team.new(team_params)

    if team.save
      render json: TeamBlueprint.render_as_hash(team), status: :created
    else
      render json: { error: "Unprocessable Entity", messages: team.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    team = Team.find(params[:id])

    if team.update(team_params)
      render json: TeamBlueprint.render_as_hash(team), status: :ok
    else
      render json: { error: "Unprocessable Entity", messages: team.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    team = Team.find(params[:id])
    team.destroy
    head :no_content
  end

  private

  def team_params
    params.require(:team).permit(:name, :location)
  end
end
