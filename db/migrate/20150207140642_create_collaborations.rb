class CreateCollaborations < ActiveRecord::Migration
  def change
    create_table :collaborations do |t|
      t.integer :collaborator1_id
      t.integer :collaborator2_id
      t.timestamps
    end
  end
end
