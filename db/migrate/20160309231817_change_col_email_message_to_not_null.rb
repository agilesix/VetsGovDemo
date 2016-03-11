class ChangeColEmailMessageToNotNull < ActiveRecord::Migration
  def change
  	change_column :contacts, :email, :string, null: false
  	change_column :contacts, :message, :string, null: false
  	
  end
end
