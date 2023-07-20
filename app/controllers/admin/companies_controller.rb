class Admin::CompaniesController < ApplicationController
  before_action :set_company, only: %i[ show edit update destroy ]
	def index
		@company = Company.all
	end
	def new
		@company = Company.new
	end

	def show
	end

	 def edit
	 end

	def create
		 @company = Company.new(company_params)
    if @company.save
      redirect_to admin_company_path(@company)
    else
      render :new, status: :unprocessable_entity
    end
  end
   def update
    if @company.update(company_params)
      redirect_to  admin_company_path(@company)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @company.destroy
    redirect_to admin_companies_path, status: :see_other
  end

  private
  def set_company
    @company = Company.find(params[:id])
  end
  def company_params
  	 params.require(:company).permit(:title, :description)
  end
end
