class CreateLabels < ActiveRecord::Migration
  def change
    create_table :labels do |t|
      t.references :course, index: true
      t.references :credential, index: true
      t.string :title

      t.timestamps
    end
  end
end
