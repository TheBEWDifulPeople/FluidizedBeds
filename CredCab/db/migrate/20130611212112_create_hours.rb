class CreateHours < ActiveRecord::Migration
  def change
    create_table :hours do |t|
      t.references :user, index: true

      t.timestamps
    end
  end
end
