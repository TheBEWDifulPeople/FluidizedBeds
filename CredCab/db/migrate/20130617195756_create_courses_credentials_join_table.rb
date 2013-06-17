class CreateCoursesCredentialsJoinTable < ActiveRecord::Migration
  def change
    create_join_table :courses, :credentials, :id => false do |t|
      # t.index [:course_id, :credential_id]
      # t.index [:credential_id, :course_id]
    end
  end
end
