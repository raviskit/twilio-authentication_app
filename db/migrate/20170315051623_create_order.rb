class CreateOrder < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :product, foreign_key: true
    end
  end
end
