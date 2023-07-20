class ProfilesController < ApplicationController
	before_action :set_profile, only: %i[ show edit update destroy ]
	def index		
	end

	def new
		@profile = Profile.new
	end

	def show
	end

	def edit
	end

	def create
		@profile = Profile.new(profile_params)
		@profile.user_id = current_user.id
		@profile.is_complete = true
    if @profile.save    	
      redirect_to @profile
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @profile.update(profile_params)
      redirect_to @profile
    else
      render :edit, status: :unprocessable_entity
    end
  end

  
  private
  def set_profile
  	@profile = Profile.find(params[:id])
  end
  def profile_params
  	params.require(:profile).permit(:name, :email, :user_id)
  end
end