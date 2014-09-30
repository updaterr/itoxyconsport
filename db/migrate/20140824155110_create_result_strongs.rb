class CreateResultStrongs < ActiveRecord::Migration
  def change
    create_table :result_strongs do |t|
      t.integer :competition_strong_id
      t.integer :project_strong_id
      t.integer :player_strong_id
      t.integer :result1
      t.boolean :result1ok
      t.integer :result2
      t.boolean :result2ok
      t.integer :result3
      t.boolean :result3ok
      t.integer :result4
      t.boolean :result4ok
      t.integer :result5
      t.boolean :result5ok
      t.integer :result6
      t.boolean :result6ok
      t.integer :result7
      t.boolean :result7ok
      t.integer :result8
      t.boolean :result8ok
      t.integer :result9
      t.boolean :result9ok
      t.integer :result10
      t.boolean :result10ok

      t.timestamps
    end
  end
end
