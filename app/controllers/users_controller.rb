class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :show, :update]
  authority_actions :edit => 'update'
  rescue_from Authority::SecurityViolation, with: :redirect_to_root

  def index
    @users = User.all
  end

  def show
    
  end

  def edit
    authorize_action_for(@user)
  end

  def profile
    @user = current_user
    render 'show'
  end

  def update
    authorize_action_for(@user)
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render action: 'edit'
    end
  end

  private
  def set_user
    @user = User.friendly.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password, :admin)
  end

  def redirect_to_root
    redirect_to root_path, notice: "Not allowed"
  end
end