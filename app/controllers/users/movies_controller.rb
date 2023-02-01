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
  
  # def top_rated
  #   @conn = Faraday.new(url: 'https://api.themoviedb.org/3',
  #     headers: { 'Authorization' => 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmMGY5ZjMzZmE0MTZlMjAyM2FmZWU2NTU2MmQ5MmRmNyIsInN1YiI6IjYzZDlmODZiOTU1YzY1MDBhODQzMGZiMyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Bp_qmnzMc-otjEGOSbQUm69Ia0dhlgUJRY1rhMVzHFc' })
      
  #     top_rated = @conn.get('movie/top_rated')
  #     json = JSON.parse(top_rated.body, symbolize_names: true)
  #     @movies = json[:results]
  #     require 'pry'; binding.pry
  #   render :index
  # end

  # def keyword
  #   @movies = #MOVIES QUERY BY KEYWORD(params[:keyword])
  #   render :index
  # end

end
