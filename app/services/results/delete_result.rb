# frozen_string_literal: true

module Results
  class DeleteResult
    attr_accessor :result

    def initialize(result:)
      @result = result
    end

    def call
      result.destroy!
    end
  end
end
