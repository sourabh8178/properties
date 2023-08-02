class HomeController < ApplicationController
	before_action :check_profile
	
	def index
		@properties = Property.all
		if (params[:rangeValue].to_i > 0 && params[:rangeValue].present?)
			@properties = @properties.where('price < ?', params[:rangeValue].to_i)
		end
		if params[:bedrooms].present?
			@properties = @properties.where(bedrooms: params[:bedrooms])
		end
		if params[:bathrooms].present?
			@properties = @properties.where(bathrooms: params[:bathrooms])
		end
		if params[:location].present?
			@properties = @properties.where(location: params[:location])
		end
		@agents = User.agents
		@posts = Post.all
	end


	def show
		@property = Property.friendly.find(params[:id])
    @agent = User.agents.last(3)
    @feedbacks = @property.feedbacks
	end

	def agent_view
		@user = User.find(params[:id])
		@agent_profile = @user.profile
		@company = @user.company
		@property = @user.properties
	end

	def view_all_property
		@properties = Property.all
	end

	def agent_list
		@agents = User.agents
	end

	def about
		
	end
end

