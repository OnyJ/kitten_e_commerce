class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.boolean :admin

      t.timestamps
    end
  end
end
