class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search
   
  def set_search
    @q = Item.ransack(params[:q])
    # @p = Category.ransack(params[:q])
    @search_items = @q.result(distinct: true)
    # @search_category= @p.result(distinct: true)
  end

  private

  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == Rails.application.credentials[:basic_auth][:user] &&
      password == Rails.application.credentials[:basic_auth][:pass]
    end
  end  

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:lastname, :firstname, :firstnameKANA, :lastnameKANA, :nickname, :birth_date])
  end
end
