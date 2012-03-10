# == Schema Information
#
# Table name: contacts
#
#  id         :integer         not null, primary key
#  first_name :string(255)
#  last_name  :string(255)
#  email      :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Contact < ActiveRecord::Base
	attr_accessible :first_name, :last_name, :email
	validates :first_name, :presence => true
	validates :last_name, :presence => true
	has_many :notes
end
