require 'spec_helper'

describe "Contacts" do
	describe "create" do
		describe "failure" do

			it "should not create a new Contact" do
				visit new_contact_path
				fill_in "First name", :with => ""
				fill_in "Last name", :with => ""
				fill_in "Email", :with => ""
				click_button
				response.should render_template('contacts/new')
				response.should have_selector("div#error_explanation")
			end

		end
	end
end
