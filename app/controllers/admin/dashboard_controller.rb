class Admin::DashboardController < ApplicationController
  layout 'admin'
  before_action :authentication_admin!
  def index  	
  end
end
