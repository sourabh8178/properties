class PropertiesController < ApplicationController
  before_action :set_property, only: %i[ show edit update destroy ]
  before_action :check_profile
  before_action :check_profile_for_agent, only: %i[ create new edit update destroy ]
  skip_before_action :verify_authenticity_token


  # GET /properties or /properties.json
  def index
    @properties = current_user.properties
  end

  # GET /properties/1 or /properties/1.json
  def show
  end

  # GET /properties/new
  def new
    @property = Property.new
  end

  # GET /properties/1/edit
  def edit
  end

  # POST /properties or /properties.json
  def create
    @property = current_user.properties.new(property_params)
    @property.images = params[:property][:images]
    respond_to do |format|
      if @property.save
        format.html { redirect_to property_url(@property), notice: "Property was successfully created." }
        format.json { render :show, status: :created, location: @property }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /properties/1 or /properties/1.json
  def update
    respond_to do |format|
      if @property.update(property_params)
        format.html { redirect_to property_url(@property), notice: "Property was successfully updated." }
        format.json { render :show, status: :ok, location: @property }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /properties/1 or /properties/1.json
  def destroy
    @property.destroy

    respond_to do |format|
      format.html { redirect_to properties_url, notice: "Property was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def feedback
    property = Property.friendly.find(params[:id])
    property.feedbacks.create(name: params[:feedback][:name], email: params[:feedback][:email], message: params[:feedback][:message])
    redirect_to home_property_path(property)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_property
      @property = Property.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def property_params   
    params.require(:property).permit(:name,:description, :size, :price, :amenities, :location, :property_type, :bedrooms, :bathrooms, :parking, :images)
   end
end
