class Admin::PropertiesController < ApplicationController
	before_action :set_property, only: %i[ show edit update destroy ]
	def index
		@property = Property.all
	end

	def new
		@property = Property.new
	end

	def show
	end

	def edit
	end

	def create
		@property = Property.new(property_params)
    if @property.save
      redirect_to admin_property_path(@property)
    else
      render :new, status: :unprocessable_entity
    end
	end

	def update
    if @property.update(property_params)
      redirect_to  admin_property_path(@property)
    else
      render :edit, status: :unprocessable_entity
    end
  end

	def destroy
    @property.destroy
    redirect_to admin_properties_path, status: :see_other
  end

	private
	 def set_property
	 	@property = Property.find(params[:id])
	 end

	 def property_params
	 	params.require(:property).permit(:name,:description, :size, :price, :amenities, :location, images: [])
	 end
end