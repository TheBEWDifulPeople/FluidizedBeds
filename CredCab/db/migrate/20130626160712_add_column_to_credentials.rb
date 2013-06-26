class AddColumnToCredentials < ActiveRecord::Migration
  def change
    add_column :credentials, :has_credential_image, :boolean
  end
end
