class SubGenresController < ApplicationController
  def show
    @sub_genre = SubGenre.find(params[:id])
  end

  def index
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
    @sub_genres = SubGenre.all
  end

  def new
    @genre_name =Genre.all
    @sub_genre =SubGenre.new
  end

  def edit
    @genre_name =Genre.all
    @sub_genre =SubGenre.find(params[:id])
  end

  def update
    @sub_genre = SubGenre.find(params[:id])
    if @sub_genre.update_attributes(sub_genre_params)
      redirect_to "/sub_genres"
    else
      render 'edit'
    end
  end

  def destroy
    SubGenre.find(params[:id]).destroy
    flash[:notice] = 'deleted successfully'
    redirect_to "/sub_genres"
  end

  def create
    @sub_genre = SubGenre.new(sub_genre_params)    
    if @sub_genre.save
      redirect_to users_url
    else
      render 'new'
    end
  end

  private 
    def sub_genre_params
      params.require(:sub_genre).permit(:name,:genre_id)
    end 
end
