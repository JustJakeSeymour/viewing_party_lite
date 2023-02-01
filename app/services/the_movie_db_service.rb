class TheMovieDbService
  def self.get_movie_data
    response = conn.get()
    parse(response)
  end
  
  def self.conn
  end

  def self.parse
    JSON.parse
  end
end