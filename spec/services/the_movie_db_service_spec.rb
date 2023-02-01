require 'rails_helper'

RSpec.describe TheMovieDbService do
  describe "class methods" do
    describe "#get_movie_data" do
      it "returns movie data" do
        search = TheMovieDbService.get_movie_data('movie/top_rated')
        first = search.first

        expect(search).to be_an Array
        
        expect(first).to have_key :title
        expect(first[:title]).to be_a(String)

        expect(first).to have_key :overview
        expect(first[:overview]).to be_a(String)

        expect(first).to have_key :vote_average
        expect(first[:vote_average]).to be_a(Float)

        expect(first).to have_key :vote_count
        expect(first[:vote_count]).to be_an(Integer)
        
        expect(first).to have_key :id
        expect(first[:id]).to be_an(Integer)
      end
    end
  end
end