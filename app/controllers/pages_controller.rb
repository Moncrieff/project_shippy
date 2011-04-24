class PagesController < ApplicationController
  def home
    @title = "Главная"
  end

  def about
    @title = "О нас"
  end

  def contact
    @title = "Контакты"
  end

end
