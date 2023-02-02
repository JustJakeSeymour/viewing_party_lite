require 'rails_helper'

RSpec.describe "Movie Details Page (User Movie Show)" do
  before :each do
    @user = create(:user)
    visit user_movie_path(@user, 238)  
  end
  
  describe "displays BUTTONS to" do
    xit "create a viewing party" do
      expect(page).to have_button("Create Viewing Party for The Godfather")
    end
    
    it "return to Discover Page" do
      expect(page).to have_button("Discover Page")
      click_link("Discover Page")

      expect(current_path).to eq user_discover_index_path(@user)
    end
  end

  describe "displays movie info" do
    it "displays all movie info" do
      within "#movie-header" do
        expect(page).to have_content("The Godfather")
      end
      
      within "#movie-details" do
        expect(page).to have_content("Vote: 8.7")
        expect(page).to have_content("Runtime:")
        expect(page).to have_content("Genre:")
        expect(page).to have_content("Summary: Spanning the years 1945 to 1955,")
        expect(page).to have_content("Cast:")
        expect(page).to have_content("Reviews:")
      end
    end
  end
end