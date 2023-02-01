class Users::MoviesController < ApplicationController
  def index
    if params[:q] == "top_rated"
      @movies = MoviesFacade.top_rated
    elsif params[:q] == "keyword"
      @movies = MoviesFacade.keyword_search(params[:keyword])
    end
  end
  
  def show
  end
end
