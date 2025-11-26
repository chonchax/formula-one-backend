class CreateRaces < ActiveRecord::Migration[8.1]
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')

    create_table :races, id: :uuid do |t|
      t.string :name
      t.string :location
      t.string :all_time_best_time

      t.timestamps
    end
  end
end
