require 'spec_helper'

describe "LayoutLinks" do
  
  it "should have an Auction index page at '/'" do
    get'/'
    response.should have_selector('title', :content => "Home", )
  end
  
  it "should have an About page at '/about'" do
    get '/about'
    response.should have_selector('title', :content => "About")
  end
  
  it "should have a Contacts page at '/contacts'" do
    get '/contacts'
    response.should have_selector('title', :content => "Contacts") 
  end
  
  it "should have a Sign up page at '/signup'" do
    get '/signup'
    response.should have_selector('title', :content => "Sign up")
  end
 
end
