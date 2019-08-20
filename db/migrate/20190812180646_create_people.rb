class CreatePeople < ActiveRecord::Migration[5.2]
  def change
    create_table :people do |t|
      t.string :first_name, null: false
      t.string :last_name
      t.string :middle_name
      t.string :full_name, null: false
      t.boolean :sex

      t.timestamps
    end
  end
end
