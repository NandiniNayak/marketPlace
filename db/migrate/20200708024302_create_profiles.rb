class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string :name
      t.integer :age
      t.text :bio

      t.timestamps
    end
  end
end
