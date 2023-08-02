class ProfilesController < ApplicationController
	before_action :set_profile, only: %i[ show edit update destroy ]

	def index		
	end

	def new
		@profile = Profile.new
	end

	def show
		id = @profile.user_id
		@user = User.find(id) 
		@properties = @user.properties
		@company = @user.company
	end

	def edit
	end

	def create
		@profile = Profile.new(profile_params)
		@profile.user_id = current_user.id
		@profile.email = current_user.email
		@profile.is_complete = true
		@profile.profile_image = params[:profile][:profile_image]
    if @profile.save    	
      redirect_to(request.referer)
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
  	params.require(:profile).permit(:name, :email, :user_id, :mobile_number, :address, :profile_image)
  end
end