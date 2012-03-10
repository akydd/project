require 'spec_helper'

describe Contact do

	before(:each) do
		@attr = { :first_name => "Example",
			:last_name => "Contact",
			:email => "contact@example.com" }
	end

	it "should create a new instance given valid data" do
		Contact.create!(@attr)
	end

	it "should require a first name" do
		no_first_name_contact = Contact.new(@attr.merge(:first_name => ""))
		no_first_name_contact.should_not be_valid
	end

	it "should require a last name" do
		no_last_name_contact = Contact.new(@attr.merge(:last_name => ""))
		no_last_name_contact.should_not be_valid
	end
end

