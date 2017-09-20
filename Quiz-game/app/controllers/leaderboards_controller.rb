class LeaderboardsController < ApplicationController
  def lgenre
    puts params[:id]
    @genrename= Genre.find(params[:id])
    @lgenre = @genrename.leaderboard_genres
    @lgenre1 = Array.new
    Array(@lgenre).each do |genre|
      @name = User.find(genre.user_id)
      @lgenre1.push([@name.username, genre.score,@genrename.name,@name])
    end
  end

  def lsub_genre
    @sub_genrename= SubGenre.find(params[:id])
    @lsub_genre = @sub_genrename.leaderboard_sub_genres
    @lsubgenre1 = Array.new
    Array(@lsub_genre).each do |sub_genre|
      @name = User.find(sub_genre.user_id)
      @lsubgenre1.push([@name.username, sub_genre.score ,@sub_genrename.name, @name])
    end
  end

  def lquiz  
    @quiz_name = Quize.find(params[:id]).name
    @state_game=Quize.find(params[:id]).game_state
    @lquiz=Array.new
    Array(@state_game).each do |quiz|
      @name = User.find(quiz.user_id)
      @lquiz.push([@name,@name.username,quiz.Score])
    end
  end
end
