class CreatePizzerias < ActiveRecord::Migration
  def change
    create_table :pizzerias do |t|
      t.string :name
      t.text :description
      t.string :address
      t.string :owner
      t.string :phone

      t.timestamps
    end
  end
end
