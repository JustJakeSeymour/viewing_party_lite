class Users::MoviesFacade
  def self.top_rated
    TheMovieDbService.get_movie_data('movie/top_rated')
  end

  def self.keyword_search(query)
    TheMovieDbService.get_movie_data("search/movie?query=#{query}")
  end
end