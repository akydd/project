# == Schema Information
#
# Table name: notes
#
#  id         :integer         not null, primary key
#  title      :string(255)
#  content    :string(255)
#  contact_id :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Note < ActiveRecord::Base
	attr_accessible :title, :content
	belongs_to :contact
	validates :contact_id, :presence => true
	default_scope :order => 'notes.created_at DESC'
end
