class AddUserIdToPizzerias < ActiveRecord::Migration
  def change
    add_column :pizzerias, :user_id, :integer
  end
end
