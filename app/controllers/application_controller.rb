require "pagy"

class ApplicationController < ActionController::API
  include Pagy::Backend
end
