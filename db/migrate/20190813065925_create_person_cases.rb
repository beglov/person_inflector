class CreatePersonCases < ActiveRecord::Migration[5.2]
  def change
    create_table :person_cases do |t|
      t.references :person, foreign_key: true, null: false
      t.string :case_type, null: false
      t.string :first_name, null: false
      t.string :last_name
      t.string :middle_name
      t.string :full_name, null: false

      t.timestamps
    end
  end
end
