class Users::MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    if params[:q] == "top_rated"
      @movies = Users::MoviesFacade.top_rated
    elsif params[:q] == "keyword"
      @movies = Users::MoviesFacade.keyword_search(params[:keyword])
    end
  end
  
  def show
    @user = User.find(params[:user_id])
    @movie = Users::MoviesFacade.movie(params[:id])
    @movie_cast = Users::MoviesFacade.cast(params[:id])
    @movie_reviews = Users::MoviesFacade.reviews(params[:id])
  end
end
