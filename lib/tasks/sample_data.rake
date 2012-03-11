namespace :db do
	desc "Fill database with test data"
	task :populate => :environment do
		Rake::Task['db:reset'].invoke
		Contact.create!(:first_name => "Test",
				:last_name => "Contact",
				:email => "test@contact.org")
		99.times do |n|
			first_name = Faker::Name.first_name
			last_name = Faker::Name.last_name
			email = Faker::Internet.email
			Contact.create!(:first_name => first_name,
					:last_name => last_name,
					:email => email)
		end
	end
end
