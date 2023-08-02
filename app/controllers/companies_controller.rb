class CompaniesController < ApplicationController
  def index
  end

  def edit
  end

  def update
    if Company.update(company_params)
      redirect_to(request.referer)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def show
  end

  private

  def company_params
    params.require(:company).permit(:title, :description)
  end
end
