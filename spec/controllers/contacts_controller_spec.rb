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

		it "should show the contact's notes" do
			n1 = Factory(:note, :contact => @contact,
				     :title => "Foo bar",
				     :content => "Nice note!")
			n2 = Factory(:note, :contact => @contact,
				     :title => "Baz quux",
				     :content => "Nicer note!")
			get :show, :id => @contact
			response.should have_selector("td",
						      :content => n1.content)
			response.should have_selector("td",
						      :content => n2.content)
		end
	end

	describe "POST 'create'" do
		describe "failure" do

			before(:each) do
				@attr = { :first_name => "",
					:last_name => "",
					:email => "" }
			end

			it "should not create a contact" do
				lambda do
					post :create, :contact => @attr
				end.should_not change(Contact, :count)
			end

			it "should render the 'new' page" do
				post :create, :user => @attr
				response.should render_template('new')
			end
		end

		describe "success" do
			before(:each) do
				@attr = { :first_name => "New",
					:last_name => "Contact",
					:email => "new@contact.org" }
			end

			it "should create a new contact" do
				lambda do
					post :create, :contact => @attr
				end.should change(Contact, :count).by(1)
			end

			it "should redirect to the contact show page" do
				post :create, :contact => @attr
				response.should redirect_to(contact_path(assigns(:contact)))
			end
		end
	end

	describe "GET 'edit'" do

		before(:each) do
			@contact = Factory(:contact)
		end

		it "should be successful" do
			get :edit, :id => @contact
			response.should be_success
		end
	end

	describe "PUT 'update'" do

		before(:each) do
			@contact = Factory(:contact)
		end

		describe "failure" do

			before(:each) do
				@attr = { :first_name => "",
					:last_name => "",
					:email => "" }
			end

			it "should render the 'edit' page" do
				put :update, :id => @contact, :contact => @attr
				response.should render_template('edit')
			end
		end

		describe "success" do

			before(:each) do
				@attr = { :first_name => "Test",
					:last_name => "Contact",
					:email => "new@email" }
			end

			it "should change the contact's data" do
				put :update, :id => @contact, :contact => @attr
				@contact.reload
				@contact.first_name.should == @attr[:first_name]
				@contact.last_name.should == @attr[:last_name]
				@contact.email.should == @attr[:email]
			end

			it "should redirect to the contact show page" do
				put :update, :id => @contact, :contact => @attr
				response.should redirect_to(contact_path(@contact))
			end
		end
	end
end
