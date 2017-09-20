class GenresController < ApplicationController
  include SessionsHelper

  def show
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
    @genre = Genre.find(params[:id])
  end

  def index
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
    @genre = Genre.all
  end

  
  def new
    @genre =Genre.new
  end

  def edit
    @genre=Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update_attributes(genre_params)
      redirect_to "/genres"
    else
      render 'edit'
    end
  end

  def destroy
    Genre.find(params[:id]).destroy
    flash[:notice] = 'deleted successfully'
    redirect_to "/genres" 
  end  

  def create
    @genre = Genre.new(genre_params)    
    if @genre.save
      # log_in @user      
      #flash[:success] = "Welcome to the Sample App!"
      redirect_to users_url
      # Handle a successful save.
    else
      render 'new'
    end
  end

  private 
    def genre_params
      params.require(:genre).permit(:name)
    end 
end
