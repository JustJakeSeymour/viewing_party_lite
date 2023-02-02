require 'rails_helper'

RSpec.describe MovieService do
  describe 'class methods' do
    describe '.top_rated_movies' do
      it 'returns top rated movies data' do
        search = MovieService.top_rated_movies

        expect(search).to be_a Hash
        expect(search[:results]).to be_an Array
        movie_data = search[:results].first

        expect(movie_data).to have_key :title
        expect(movie_data[:title]).to be_a(String)

        expect(movie_data).to have_key :id
        expect(movie_data[:id]).to be_a(Integer)

        expect(movie_data).to have_key :vote_average
        expect(movie_data[:vote_average]).to be_a(Float)
      end
    end
  end
end