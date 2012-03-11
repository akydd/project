class AddIndexToNotes < ActiveRecord::Migration
  def change
	  add_index :notes, [:contact_id, :created_at]
  end
end
