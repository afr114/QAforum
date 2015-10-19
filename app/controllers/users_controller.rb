class UsersController < ApplicationController
  before_action :set_user, only: [ :show, :edit, :create, :destroy ]

  def index
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end

    def set_user
      @user = User.find(params[:id])
    end



end
