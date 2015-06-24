class CreatePizzerias < ActiveRecord::Migration
  def change
    create_table :pizzerias do |t|
      t.string :name
      t.text :description
      t.string :founded
      t.string :owner
      t.string :rating

      t.timestamps
    end
  end
end
