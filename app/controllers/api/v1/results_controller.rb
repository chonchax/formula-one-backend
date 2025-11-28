# frozen_string_literal: true

class Api::V1::ResultsController < ApplicationController
  def create
    edition = RaceEdition.find(params[:race_edition_id])

    result = Results::CreateResult.new(
      race_edition: edition,
      driver_id: params[:driver_id],
      team_id: params[:team_id],
      position: params[:position],
      points: params[:points],
      best_lap_time: params[:best_lap_time]
    ).call

    render json: ResultBlueprint.render_as_hash(result), status: :created
  end

  def update
    result = Result.find(params[:id])

    updated = Results::UpdateResult.new(
      result: result,
      params: result_params
    ).call

    render json: ResultBlueprint.render_as_hash(updated), status: :ok
  end

  def destroy
    result = Result.find(params[:id])

    Results::DeleteResult.new(result: result).call

    head :no_content
  end

  private

  def result_params
    params.permit(:position, :points, :best_lap_time, :driver_id, :team_id)
  end
end
