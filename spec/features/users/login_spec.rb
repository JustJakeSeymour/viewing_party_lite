require 'rails_helper'

RSpec.describe "User Login Page" do

  describe "User Login" do
    before :each do
      @user = create(:user, email: "valid@email.com", password: "SoMeRaNdOm_Str1n6")
    end
    context "user story 3 - happy path" do
      it "log in link" do
        visit root_path

        expect(page).to have_button("Log In")
        click_button("Log In")

        expect(current_path).to eq("/login")
      end

      it "has log in form" do
        visit login_path
        
        expect(page).to have_field("Email")
        expect(page).to have_field("Password")
      end
      
      it "can be filled in with existing email and password" do
        visit login_path
        
        fill_in("Email", with: "valid@email.com")
        fill_in("Password", with: "SoMeRaNdOm_Str1n6")

        click_button("Log In")

        expect(current_path).to eq("/users/#{@user.id}")
      end
    end
    
    context "user story 4 - sad path" do
      it "log in sad path" do
        visit login_path
        
        fill_in("Email", with: "valid@email.com")
        fill_in("Password", with: "WrongPassword")
    
        click_button("Log In")
    
        expect(page).to have_content("Password invalid")
      end
    end
  end
  
end