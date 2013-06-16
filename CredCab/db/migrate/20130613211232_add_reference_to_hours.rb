class AddReferenceToHours < ActiveRecord::Migration
  def change
    add_reference :hours, :credential, index: true
    add_reference :hours, :course, index: true
  end
end
