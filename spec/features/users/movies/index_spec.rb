require 'rails_helper'

RSpec.describe "Movies Results (Index) Page" do
  before :each do
    @user = create(:user)
    visit user_discover_index_path(@user)  
  end

  describe "display movies from top rated" do
    it "happy path" do
      click_button("Find Top Rated Movies")
      
      expect(current_path).to eq("/users/#{@user.id}/movies")
      
      expect(page.status_code).to eq 200
      expect(page).to have_content("The Godfather")
    end
    
    it "links to movie show" do
      click_button("Find Top Rated Movies")

      expect(page).to have_link("The Godfather")

      click_link("The Godfather")

      expect(current_path).to eq("/users/#{@user.id}/movies/238")
    end
  end
  
  describe "display movies keyword search" do
    it "happy path" do
      fill_in(:keyword, with: "Lego")
      
      click_button("Find Movies")
      expect(current_path).to eq("/users/#{@user.id}/movies")
      
      expect(page.status_code).to eq 200
      expect(page).to have_content("The Lego Movie")
    end
    
    it "links to movie show" do
      fill_in(:keyword, with: "Lego")
      
      click_button("Find Movies")
  
      expect(page).to have_link("The Lego Movie")
  
      click_link("The Lego Movie")
  
      expect(current_path).to eq("/users/#{@user.id}/movies/137106")
    end
  end
end