require 'spec_helper'

describe "Notes" do
	describe "create" do
		describe "success" do

			before (:each) do
				@contact = Factory(:contact)
			end

			it "should create a new note" do
				lambda do
					visit new_contact_note_path(@contact)
					fill_in "Title", :with => "title"
					fill_in "Content", :with => "note contents"
					click_button
					response.should render_template('contacts/show')
					#respone.should have_selector("")
				end.should change(Note, :count).by(1)
			end
		end
	end
end
