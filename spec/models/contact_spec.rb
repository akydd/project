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

	describe "helper contact model methods" do

		before(:each) do
			@contact = Contact.create!(@attr)
		end
		
		it "should have a name method" do
			@contact.should respond_to(:name)
		end

		it "should combine both names into one" do
			@contact.name.should == @attr[:first_name] + " " +
				@attr[:last_name]
		end
	end

	describe "note associations" do

		before(:each) do
			@contact = Contact.create(@attr)
			@note1 = Factory(:note, :contact => @contact, :created_at => 1.day.ago)
			@note2 = Factory(:note, :contact => @contact, :created_at => 1.hour.ago)
		end

		it "should have a notes attribute" do
			@contact.should respond_to(:notes)
		end

		# note ordering is handled @ controller level now
		#it "should have the right notes in the right order" do
		#	@contact.notes.should == [@note2, @note1]
		#end
	end
end

