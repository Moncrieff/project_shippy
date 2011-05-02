class PagesController < ApplicationController
  def home
    @title = "Home"
  end

  def about
    @title = "About"
  end

  def contact
    @title = "Contacts"
  end
  
  def signin
    @title = "Sign in"
  end
  
  def signup
    @title = "Sign up"
    
  end

end
