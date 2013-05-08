class ChangeDataTypeInPictures < ActiveRecord::Migration
  def up
  	add_column :pictures, :user_id, :integer
  end

  
end
