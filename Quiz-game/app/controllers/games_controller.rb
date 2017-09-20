class GamesController < ApplicationController
  include SessionsHelper
  


  def remove
    @uid =Quize.find(params[:id])
    @score_update = GameState.find_by(quize_id: params[:id],user_id: current_user.id)    
    @score_update1 = LeaderboardGenre.find_by(user_id: current_user.id,genre_id: @uid.sub_genre.genre.id)
    @score_update2 =  LeaderboardSubGenre.find_by(user_id: current_user.id,sub_genre_id: @uid.sub_genre.id)
    @score_update1.score = @score_update1.score - @score_update.Score
    @score_update1.save
    @score_update2.score = @score_update2.score - @score_update.Score
    @score_update2.save
    GameState.find_by(quize_id: params[:id],user_id: current_user.id).delete    
    redirect_to "/games/" + String(params[:id])
  end   


  def show 
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
    @game= Quize.find(params[:id])
    puts @game.id
    @current_count = GameState.find_by(quize_id: @game.id, user_id: current_user.id)
    puts @current_count
    if(@current_count==nil)
      puts "ifcondition"
      @game_state = GameState.create(user_id: current_user.id ,quize_id: @game.id, Attempt: 0, Complete: false,Score: 0)
      @game.questions.each do |question|
        @quiz_state =QuizState.create(user_id: current_user.id, question_id: question.id,MyQuiz_id: @game.id)
      end
      if(LeaderboardGenre.find_by(user_id: current_user.id,genre_id:  @game.sub_genre.genre.id)==nil)
          LeaderboardGenre.create(user_id: current_user.id ,quize_id: @game.id, genre_id: @game.sub_genre.genre.id, score: 0)
      end
      if(LeaderboardSubGenre.find_by(user_id: current_user.id,sub_genre_id:  @game.sub_genre.id)==nil)        
        LeaderboardSubGenre.create(user_id: current_user.id ,quize_id: @game.id, sub_genre_id: @game.sub_genre.id, score: 0)         
      end
      redirect_to "/quizes/" + String(@game.id)      
    else 
      if(@current_count.Attempt==5)
        flash[:success] = "You have completed the Quiz"
        redirect_to "/users/" + String(current_user.id)
      else
        redirect_to "/quizes/" + String(@game.id)
      end
    end
  end

  def play
    answer=""
    Array(params[:Options]).each do |val|
      answer=answer+String(val)
    end

    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
    
    unique1 = Integer(params[:quizzy1])
    unique2 = Integer(params[:quizzy2])
    unique3 = Integer(params[:quizzy3])
    object =  Quize.find(unique1)
    @update1 = GameState.find_by(quize_id: unique1, user_id: current_user.id)
    @update2 = Question.find_by(id: unique2)
    @update4 = LeaderboardGenre.find_by(user_id:current_user.id ,genre_id: object.sub_genre.genre_id)
    @update5 = LeaderboardSubGenre.find_by(user_id:current_user.id ,sub_genre_id: object.sub_genre.id)    
    @update1.Attempt+=1
    @update1.save
    if(answer==@update2.Correct_Answer)
      @update1.Score+=5
      @update1.save
      @update4.score+=5
      @update4.save
      @update5.score+=5
      @update5.save      
    end
    QuizState.find_by(user_id: current_user.id, question_id: unique2 ).delete
    redirect_to '/games/'+ String(unique1)


  end

end
