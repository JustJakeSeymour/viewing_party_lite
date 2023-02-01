class TheMovieDbService
  def self.get_movie_data(path)
    response = conn.get(path)
    json = parse(response)
    json[:results]
  end
  
  def self.conn
    Faraday.new(url: 'https://api.themoviedb.org/3') do |faraday|
      faraday.headers['Authorization'] = ENV['movies_api_key']
    end
  end

  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end