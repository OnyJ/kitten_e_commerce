class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.boolean :is_admin, default: false
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
