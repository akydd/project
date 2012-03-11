require 'spec_helper'

describe NotesController do
	render_views

	before (:each) do
		@contact = Factory(:contact)
	end

	describe "GET 'new'" do

		it "should be successful" do
			get 'new', :contact_id => @contact
			response.should be_success
		end
	end

	describe "POST 'create'" do

		describe "success" do

			before(:each) do
				@attr = { :title => "title",
					:content => "content"}
			end

			it "should create a new note" do
				lambda do
					post :create, :contact_id => @contact,
						:note => @attr
				end.should change(Note, :count).by(1)
			end

			it "should redirect to the contact show page" do
				post :create, :contact_id => @contact,
					:note => @attr
				response.should redirect_to(contact_path(@contact))
			end
		end
	end
end
