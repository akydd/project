class PagesController < ApplicationController
  def home
	  @title = "Home"
  end

  def search
	  @title = "Search Contacts"
  end
end
