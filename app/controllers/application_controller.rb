class ApplicationController < ActionController::Base
  include JSONAPI::ActsAsResourceController
#  protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token, raise: false
  protect_from_forgery with: :null_session

end
