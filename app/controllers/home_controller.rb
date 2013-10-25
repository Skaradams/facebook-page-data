class HomeController < ApplicationController
  def index
    @page = Page.new
    @pages = Page.all
  end
end
