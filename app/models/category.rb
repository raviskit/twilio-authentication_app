class Category < ApplicationRecord
  has_many :products
  def self.search_filter(category_id, price)
    @p =  price.blank? ? "asc" : price
    if category_id and category_id != "0"
      find(category_id).products.order(price: @p)
    else
      Product.all.order(price: @p)
    end
  end
end
