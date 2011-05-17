require 'spec_helper'

describe "Users" do
  
  describe "signup" do
    
    describe "failure" do
      it "should not make a new user" do
        lambda do
          visit signup_path
          fill_in "Name",         :with => ""
          fill_in "Email",        :with => ""
          fill_in "Password",     :with => ""
          fill_in "Confirmation", :with => ""
          click_button
          response.should render_template('users/new')
        end.should_not change(User, :count)
      end
    end
    
    describe "success" do
      it "should make a new user" do
        lambda do
          visit signup_path
          fill_in "Name",         :with => "Michael Hitchinson"
          fill_in "Email",        :with => "michael@hitchinson.com"
          fill_in "Password",     :with => "michael"
          fill_in "Confirmation", :with => "michael"
          click_button
          response.should have_selector('div.flash.success', 
                                        :content => "Welcome")
          response.should render_template('users/show')                                      
        end.should change(User, :count).by(1)
      end
    end
    
  end
  
end
