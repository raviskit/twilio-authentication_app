class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  rescue_from CanCan::AccessDenied do | exception |
   redirect_to root_url, alert: exception.message
 end
  helper_method :current_order
  def current_order
    if  !session[:order_id].nil?
      Order.find(session[:order_id])
    else
      Order.new
    end
  end
end
