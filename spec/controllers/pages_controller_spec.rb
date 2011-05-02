require 'spec_helper'

describe PagesController do
  render_views

  describe "GET 'home'" do
    it "should be successful" do
      get 'home'
      response.should be_success
    end
    
    it "should have the right title" do
      get 'home'
      response.should have_selector("title",
                            :content => "Project Shippy | Home")
    end
  end

  describe "GET 'about'" do
    it "should be successful" do
      get 'about'
      response.should be_success
    end
    
    it "should have the right title" do
      get 'about'
      response.should have_selector("title",
                            :content => "Project Shippy | About")
    end
  end

  describe "GET 'contact'" do
    it "should be successful" do
      get 'contact'
      response.should be_success
    end
   
    it "should have the right title" do
      get 'contact'
      response.should have_selector("title",
                            :content => "Project Shippy | Contact")
    end

  end
  
    describe "GET 'signin'" do
    it "should be successful" do
      get 'signin'
      response.should be_success
    end
    
    it "should have the right title" do
      get 'signin'
      response.should have_selector("title",
                            :content => "Project Shippy | Sign in")
    end

  end

  describe "GET 'signup'" do
    it "should be successful" do
      get 'signup'
      response.should be_success
    end
    
    it "should have the right title" do
      get 'signup'
      response.should have_selector("title",
                            :content => "Project Shippy | Sign up")
    end

  end


end
