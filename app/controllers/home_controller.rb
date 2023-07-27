class HomeController < ApplicationController
	def index
		@properties = Property.last(6)
	end
end