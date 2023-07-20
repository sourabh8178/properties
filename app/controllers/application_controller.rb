class ApplicationController < ActionController::Base
	before_action :authenticate_user!
	# protect_from_forgery with: :exception
  before_action :user_admin, expect:[:after_sign_in_path_for]
  include ApplicationHelper
  layout :set_layout
  def after_sign_in_path_for(resource)
    resource.is_admin? ? admin_root_path : root_path
  end
  def user_admin
    if request.fullpath.split("/")[1] == "admin"
      if current_user.role != 'admin'
        redirect_to root_path
      else
        request.url
      end
    end
  end
  def authentication_admin!
    unless current_user.is_admin?
      flash[:alert] = "You are not authorized to perform this action."
      redirect_to(request.referrer || root_path)
    end
  end
end