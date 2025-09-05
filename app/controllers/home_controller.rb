class HomeController < ApplicationController
  def index
    render plain: 'Привет, это тест!'
  end
end
