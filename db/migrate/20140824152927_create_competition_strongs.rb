class CreateCompetitionStrongs < ActiveRecord::Migration
  def change
    create_table :competition_strongs do |t|
      t.string :title
      t.integer :project_strong_id
      t.integer :group_types_id
      t.integer :countrepeat

      t.timestamps
    end
  end
end
