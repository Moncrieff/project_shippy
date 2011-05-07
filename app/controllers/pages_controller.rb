class PagesController < ApplicationController

  def about
    @title = "About"
  end

  def contact
    @title = "Contacts"
  end
end
