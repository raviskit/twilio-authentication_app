class AddColumnToDocument < ActiveRecord::Migration[5.0]
  def change
    add_reference :documents, :product, foreign_key: true
  end
end
