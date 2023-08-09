class PostsController < ApplicationController
  before_action :check_profile
  def index
  end

  def show
    @user = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @user = current_user.posts.create(post_params)
    if @user.save
      redirect_to post_path(@user)
    end
  end

  private
  def post_params
    params.require(:post).permit(:name, :email, :user_id, :property_type, :transaction_type, :city, :price, :details, :phone_number)
  end
end
