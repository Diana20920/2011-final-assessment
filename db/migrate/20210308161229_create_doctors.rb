class CreateDoctors < ActiveRecord::Migration[5.2]
  def change
    create_table :doctors do |t|
      t.string :name
      t.integer :years_experience
      t.string :university

      t.timestamps
    end
  end
end
