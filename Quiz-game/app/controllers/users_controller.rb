class UsersController < ApplicationController
  include SessionsHelper
  
  def show
    @user = User.find(params[:id])
    @status =@user.game_states
    @status_name= Quize
  end

  def index
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
    @users = User.paginate(page: params[:page])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)    
    if @user.save
      log_in @user      
      # flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
      # Handle a successful save.
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to users_url
  end    

  def data
    return "#users//#{user.id}" 
  end

  private
    def user_params
      params.require(:user).permit(:username ,:email,:password,:password_confirmation,:Gender)
    end     

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless @user == current_user
    end

    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
