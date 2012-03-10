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
	belongs_to :contact
end
