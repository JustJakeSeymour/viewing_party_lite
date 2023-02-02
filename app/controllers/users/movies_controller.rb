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
  end
end
