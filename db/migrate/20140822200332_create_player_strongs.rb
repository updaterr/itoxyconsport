class CreatePlayerStrongs < ActiveRecord::Migration
  def change
    create_table :player_strongs do |t|
      t.boolean :presence
      t.integer :project_strong_id
      t.string :name
      t.string :surname
      t.string :photopath
      t.integer :group_type_id
      t.string :city
      t.string :country
      t.integer :old
      t.integer :weight
      t.integer :height
      t.text :description

      t.timestamps
    end
  end
end
