class CreateDrivers < ActiveRecord::Migration[8.1]
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')

    create_table :drivers, id: :uuid do |t|
      t.string :first_name
      t.string :last_name
      t.string :nationality
      t.integer :number
      t.integer :points
      t.references :team, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
