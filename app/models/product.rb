class Product < ApplicationRecord
  validates :title, presence: true
  validates :price, numericality: true
  has_one :document
  has_many :order_items
  belongs_to :category
  accepts_nested_attributes_for :document
  searchable do
      text :title, :base_price
      time :created_at
      string :base_price
      text :document do
        document.photo_file_name unless document.blank?
      end
  end


  def base_price
    price.to_i
  end
end
