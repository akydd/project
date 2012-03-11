Factory.define :contact do |contact|
	contact.first_name	"Test"
	contact.last_name	"Name"
	contact.email		"test@name.org"
end

Factory.sequence :email do |n|
	"person-#{n}@example.org"
end

Factory.define :note do |note|
	note.content		"Contact note"
	note.title		"Note title"
	note.association	:contact
end
