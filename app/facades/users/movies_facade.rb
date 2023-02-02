module Users
  class MoviesFacade
    def self.top_rated
      TheMovieDbService.get_movie_data('movie/top_rated')
    end

    def self.keyword_search(query)
      TheMovieDbService.get_movie_data("search/movie?query=#{query}")
    end
    
    def self.movie(movie_id)
      m = TheMovieDbService.get_movie_data("movie/#{movie_id}")
    end
    
    def self.cast(movie_id)
      m = TheMovieDbService.get_movie_data("movie/#{movie_id}/credits")
    end
    
    def self.reviews(movie_id)
      m = TheMovieDbService.get_movie_data("movie/#{movie_id}/reviews")
    end
  end
end