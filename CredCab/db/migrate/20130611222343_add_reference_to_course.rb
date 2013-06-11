class AddReferenceToCourse < ActiveRecord::Migration
  def change
    add_reference :courses, :credential, index: true
  end
end
