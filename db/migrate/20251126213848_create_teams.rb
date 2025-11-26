class CreateTeams < ActiveRecord::Migration[8.1]
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')

    create_table :teams, id: :uuid do |t|
      t.string :name
      t.string :location

      t.timestamps
    end
  end
end
