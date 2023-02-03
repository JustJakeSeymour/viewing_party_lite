require 'rails_helper'

RSpec.describe 'New Viewing Party Page' do
  before :each do
    @user = create(:user)
    string = File.read('./spec/fixtures/godfather_details.json')
    data = JSON.parse(string, symbolize_names: true)
    @movie = Movie.new(data)

    visit new_user_movie_viewing_party_path(@user, @movie.id)
  end

  it 'displays the name of the movie title' do
    expect(page).to have_content("Create a Movie Party for #{@movie.title}")
  end

  it 'displays a button to the Discover Page' do
    expect(page).to have_button('Discover Page')

    click_button("Discover Page")

    expect(current_path).to eq(user_discover_index_path(@user))
  end
