class Api::V1::ResultsController < ApplicationController
  def create
    begin
      results = ActiveRecord::Base.transaction do
        edition = RaceEdition.find_or_create_by!(
          race_id: params[:race_id],
          season: params[:season],
          race_date: params[:race_date]
        )

        params[:results].map do |result|
          Results::CreateResult.new(
            race_edition: edition,
            driver_id: result[:driver_id],
            team_id: result[:team_id],
            position: result[:position],
            points: result[:points],
            best_lap_time: result[:best_lap_time]
          ).call
        end
      end

      render json: ResultBlueprint.render_as_hash(results), status: :created

    rescue ActiveRecord::RecordInvalid => e
      render json: { error: "Unprocessable Entity", messages: e.record.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    result = Result.find(params[:id])
    updated = Results::UpdateResult.new(result: result, params: result_params).call
    render json: ResultBlueprint.render_as_hash(updated), status: :ok
  end

  def destroy
    edition = RaceEdition.find(params[:race_edition_id])
    edition.destroy
    head :no_content
  end

  private

  def result_params
    params.permit(:position, :points, :best_lap_time, :driver_id, :team_id)
  end
end
