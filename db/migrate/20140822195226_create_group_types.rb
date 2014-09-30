class CreateGroupTypes < ActiveRecord::Migration
  def change
    create_table :group_types do |t|
      t.string :name
      t.integer :project_strong_id

      t.timestamps
    end
  end
end
