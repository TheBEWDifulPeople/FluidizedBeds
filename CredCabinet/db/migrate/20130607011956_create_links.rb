class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.integer :course_id
      t.integer :credential_id

      t.timestamps
    end
  end
end
