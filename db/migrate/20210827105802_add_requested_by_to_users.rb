class AddRequestedByToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :requested_by, :integer
  end
end
