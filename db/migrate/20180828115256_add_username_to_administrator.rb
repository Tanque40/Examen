class AddUsernameToAdministrator < ActiveRecord::Migration[5.2]
  def change
    add_column :administrators, :username, :string
  end
end
