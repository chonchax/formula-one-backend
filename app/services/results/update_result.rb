# frozen_string_literal: true

module Results
  class UpdateResult
    attr_accessor :result, :params

    def initialize(result:, params:)
      @result = result
      @params = params
    end

    def call
      result.update!(
        position: params[:position],
        points: params[:points],
        best_lap_time: params[:best_lap_time]
      )
      result
    end
  end
end
