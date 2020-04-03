class CreateParks < ActiveRecord::Migration[5.1]
  def change
    create_table :parks do |t|
      t.string :name
      t.decimal :admission

      t.timestamps
    end
  end
end
