class CreatePersonCases < ActiveRecord::Migration[5.2]
  def change
    create_table :person_cases do |t|
      t.references :person, foreign_key: true
      t.string :case_type
      t.string :first_name
      t.string :last_name
      t.string :middle_name
      t.string :full_name

      t.timestamps
    end
  end
end
