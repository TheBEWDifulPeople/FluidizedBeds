class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.datetime :course_date
      t.integer :credits
      t.string :certificate

      t.timestamps
    end
  end
end
