require 'spec_helper'

describe "LayoutLinks" do

	it "should have a Home page at '/'" do
		get '/'
		response.should have_selector('title', :content => "Home")
	end

	it "should have a Search page at '/search'" do
		get '/search'
		response.should have_selector('title', :content => "Search Contacts")
	end

end
