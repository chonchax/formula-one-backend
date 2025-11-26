class CreateResults < ActiveRecord::Migration[8.1]
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')

    create_table :results, id: :uuid do |t|
      t.integer :position
      t.integer :points
      t.string :best_lap_time
      t.references :driver, null: false, foreign_key: true, type: :uuid
      t.references :team, null: false, foreign_key: true, type: :uuid
      t.references :race_edition, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
