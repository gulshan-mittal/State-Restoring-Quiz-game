class QuizesController < ApplicationController
  include SessionsHelper
  
  def new
    @sub_genre_name=SubGenre.all
    @quize =Quize.new
  end
  
  def show
    @quiz_state= QuizState.find_by(MyQuiz_id: params[:id], user_id: current_user.id)
    @game_state = GameState.find_by(quize_id: params[:id], user_id: current_user.id)
    if(@quiz_state==nil)
      GameState.find_by(quize_id: params[:id], user_id: current_user.id).delete
    end
  end 

  def index
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
    @quizes = Quize.all 
  end


  def edit
    @sub_genre_name=SubGenre.all
    @quize=Quize.find(params[:id])
  end

  def update
    @quize =Quize.find(params[:id])
    if @quize.update_attributes(quize_params)
      redirect_to "/quizes"
    else
      render 'edit'
    end
  end

  def destroy
    Quize.find(params[:id]).destroy
    flash[:notice] = 'deleted successfully'
    redirect_to "/quizes"
  end
  

  def create
    @quize = Quize.new(quize_params)    
    if @quize.save
      redirect_to users_url
    else
      render 'new'
    end
  end

  private 
    def quize_params
      params.require(:quize).permit(:name,:sub_genre_id)
    end 
end
