class ApiController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :verify_params, except: :destroy

  def verify_params
    param_name = self.class.to_s.titleize.split.first.split('/')[1].singularize.downcase
    if !params.key? param_name.to_sym
      render json: { errors: "parameter missing: #{param_name}" }, status: :unprocessable_entity and return
    end
  end

  private

  def authenticated?
    authenticate_or_request_with_http_basic { |username, password| @current_user = User.where(name: username, password: password).first } 
  end

end
