require 'spec_helper'

describe "Contacts" do
	describe "create" do
		describe "failure" do

			it "should not create a new Contact" do
				lambda do
					visit new_contact_path
					fill_in "First name", :with => ""
					fill_in "Last name", :with => ""
					fill_in "Email", :with => ""
					click_button
					response.should render_template('contacts/new')
					response.should have_selector("div#error_explanation")
				end.should_not change(Contact, :count)
			end

		end

		describe "success" do

			it "should create a new Contact" do
				lambda do
					visit new_contact_path
					fill_in "First name", :with => "HEY"
					fill_in "Last name", :with => "YA"
					fill_in "Email", :with => "hey@ya.org"
					click_button
					response.should render_template('contacts/show')
				end.should change(Contact, :count).by(1)
			end
		end
	end

end
