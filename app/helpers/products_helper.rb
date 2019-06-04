module ProductsHelper
  def category_ids
    Category.pluck(:name, :id)
  end
  def display_file(product)
    # this helper displayes the images of product
    return "assets/unknown_product_page.jpg" if product.document.blank?
    if product.document.is_image?
         product.document.photo.path(:thumb).split('public')[1]
    elsif product.document.is_pdf?
        "assets/pdfsign.png"
    else
        "assets/unknown_product_page.jpg"
    end
  end
end
