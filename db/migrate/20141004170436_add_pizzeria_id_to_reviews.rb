class AddPizzeriaIdToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :pizzeria_id, :integer
  end
end
