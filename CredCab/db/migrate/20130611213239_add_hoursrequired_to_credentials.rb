class AddHoursrequiredToCredentials < ActiveRecord::Migration
  def change
    add_column :credentials, :hoursrequired, :integer
  end
end
