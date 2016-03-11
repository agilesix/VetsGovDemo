class UpdateSentOnColumn < ActiveRecord::Migration
  def change
  	rename_column :contacts, :sentOn, :sent_on
  end
end
