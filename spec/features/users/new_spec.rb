require 'rails_helper'

RSpec.describe "User Register Page" do

  describe "authentication challenge" do
    context "user story 1" do
      it "registration with authentication happy path" do
        visit register_path
        expect(page).to have_field("Name")
        expect(page).to have_field("Email")
        expect(page).to have_field("Password")
        expect(page).to have_button("Create New User")

        fill_in("Name", with: "Username")
        fill_in("Email", with: "valid@email.com")
        fill_in("Password", with: "SoMeRaNdOm_Str1n6")
        fill_in("Confirm Password", with: "SoMeRaNdOm_Str1n6")
        
        click_button("Create New User")
        
        user = User.all.last
        
        expect(current_path).to eq("/users/#{user.id}")
        expect(page).to have_content("User successfully created")
      end
    end
    
    context "user story 2" do
      it "registration authentication sad path" do
        visit register_path
        expect(page).to have_field("Name")
        expect(page).to have_field("Email")
        expect(page).to have_field("Password")
        expect(page).to have_button("Create New User")
    
        fill_in("Name", with: "Username")
        fill_in("Email", with: "valid@email.com")
        fill_in("Password", with: "SoMeRaNdOm_Str1n6")
        fill_in("Confirm Password", with: "Not_the_same")
        
        click_button("Create New User")
        
        expect(page).to have_content("Password and confirmation must be the same")
      end
    end
  end
  
  describe "form to register" do
    it "shows required fields" do
      visit register_path
      
      expect(page).to have_field("Name")
      expect(page).to have_field("Email")
      expect(page).to have_button("Create New User")
    end
    
    describe "happy path" do
      it "successfully creates user" do
        visit register_path
        
        fill_in("Name", with: "Test")
        fill_in("Email", with: "valid@email.com")
        fill_in("Password", with: "SoMeRaNdOm_Str1n6")
        
        click_button("Create New User")
        
        user = User.all.last
        
        expect(current_path).to eq("/users/#{user.id}")
        expect(page).to have_content("User successfully created")
      end  
    end
    
    describe "sad path" do
      it "name nor email cannot be blank" do
        visit register_path
        
        fill_in("Name", with: "")
        fill_in("Email", with: "")
        
        click_button("Create New User")
        
        expect(page).to have_field("Name", with: "")
        expect(page).to have_field("Email", with: "")
        
        expect(page).to have_content("User creation failed")
      end
      
      it "name cannot be blank" do
        visit register_path
        
        fill_in("Name", with: "")
        fill_in("Email", with: "valid@email.com")
        
        click_button("Create New User")
        
        expect(page).to have_field("Name", with: "")
        expect(page).to have_field("Email", with: "valid@email.com")
        
        expect(page).to have_content("User creation failed")
      end
      
      it "email cannot be blank" do
        visit register_path
        
        fill_in("Name", with: "Test")
        fill_in("Email", with: "")
        
        click_button("Create New User")
        
        expect(page).to have_field("Name", with: "Test")
        expect(page).to have_field("Email", with: "")
        
        expect(page).to have_content("User creation failed")
      end
      
      it "email must be unique" do
        user = create(:user, email: "unique@email.com")
        
        visit register_path
        
        fill_in("Name", with: "Test")
        fill_in("Email", with: user.email)
        
        
        click_button("Create New User")
        
        expect(page).to have_field("Name", with: "Test")
        expect(page).to have_field("Email", with: user.email)
        
        expect(page).to have_content("User creation failed")
      end
    end
  end
end