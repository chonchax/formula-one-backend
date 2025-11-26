class CreateRaceEditions < ActiveRecord::Migration[8.1]
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')

    create_table :race_editions, id: :uuid do |t|
      t.integer :season
      t.date :race_date
      t.references :race, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
