class CreateProjectStrongs < ActiveRecord::Migration
  def change
    create_table :project_strongs do |t|
      t.string :name
      t.integer :user_id
      t.text :description
      t.integer :project_types_id

      t.timestamps
    end
  end
end
