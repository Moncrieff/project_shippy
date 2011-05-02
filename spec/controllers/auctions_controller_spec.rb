require 'spec_helper'

describe AuctionsController do
  render_views
  
  describe "GET 'index'" do
    it "should render 'index'" do
      get 'index'
      response.should be_success      
    end
    
    it "should have the right title" do
      get 'index'
      response.should have_selector("title",
                      :content => "Project Shippy | Home")
    end
  end
  
    describe "GET 'show'" do
    it "should render 'show'" do
      get 'show'
      response.should be_success      
    end
    
    it "should have the right title" do
      get 'show'
      response.should have_selector("title",
                      :content => "Project Shippy | Show")
    end
  end

  
end