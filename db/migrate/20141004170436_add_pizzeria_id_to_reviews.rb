class AddPizzeriaIdToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :pizzaria_id, :integer
  end
end
