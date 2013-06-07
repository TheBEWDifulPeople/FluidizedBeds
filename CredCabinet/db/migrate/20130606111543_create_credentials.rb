class CreateCredentials < ActiveRecord::Migration
  def change
    create_table :credentials do |t|
      t.string :title
      t.string :issuing_authority
      t.datetime :date_issued
      t.datetime :last_renewal
      t.datetime :next_renewal
      t.string :credential_image

      t.timestamps
    end
  end
end
