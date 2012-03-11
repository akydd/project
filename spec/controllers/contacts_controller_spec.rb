require 'spec_helper'

describe ContactsController do
	render_views

	describe "GET 'new'" do
		it "should be successful" do
			get 'new'
			response.should be_success
		end
	end

	describe "GET 'show'" do

		before(:each) do
			@contact = Factory(:contact)
		end

		it "should be successful" do
			get 'show', :id => @contact
			response.should be_success
		end

		it "should find the right contact info" do
			get 'show', :id => @contact
			assigns(:contact).should == @contact
		end

		it "should include the contact's name" do
			get 'show', :id => @contact
			response.should have_selector("h1", :content => @contact.name)
		end
	end
end
