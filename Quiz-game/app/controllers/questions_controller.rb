class QuestionsController < ApplicationController
  
  def show
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
    @quize = Quize.find(params[:id])
    puts @quize.id
  end

  def new
    @quiz_name= Quize.all
    @question=Question.new
  end 

  def edit 
    @quiz_name= Quize.all
    @question = Question.find(params[:id])
  end

  def update
    @question= Question.find(params[:id])
    if @question.update_attributes(question_params)
      flash[:success] = "Question updated"
      redirect_to "/quizes"
    else
      render 'edit'
    end
  end


  def destroy
    Question.find(params[:id]).delete
    redirect_to "/"
  end 

  def create
    @question = Question.new(question_params)    
    if @question.save
      redirect_to "/quizes"
    else
      render 'new'
    end
  end

  private 
    def question_params
      params.require(:question).permit(:Problem,:Choice, :Option_A ,:Option_B,:Option_C,:Option_D,:Correct_Answer,:quize_id)
    end 
end
