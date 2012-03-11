require 'spec_helper'

describe Note do

	before(:each) do
		@contact = Factory(:contact)
		@attr = { :content => "value for content",
			:title => "Note title" }
	end

	it "should create a new instance given valid attributes" do
		@contact.notes.create!(@attr)
	end

	describe "contact associations" do
		before(:each) do
			@note = @contact.notes.create(@attr)
		end

		it "should have contact attribute" do
			@note.should respond_to(:contact)
		end

		it "should have the right associated contact" do
			@note.contact_id.should == @contact.id
			@note.contact.should == @contact
		end
	end

	describe "validations" do
		it "should require a contact id" do
			Note.new(@attr).should_not be_valid
		end
	end
end

