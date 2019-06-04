class AddColumnToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :authy_id, :string
    add_column :users, :country_code, :string
  end
end
