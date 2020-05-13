class Order < ApplicationRecord
  def products
    product_ids = OrderProduct.where(order_id: params[:order_id]).pluck(:product_id)
    @products = Product.find(product_ids)

    return @products
  end

  def shippable?
    if params[:status] != "shipped" && products?
      shippable = true
    else
      shippable = false
    end
  end

  def ship
    if shippable?
      @order.update(status: "shipped")
      return true
    else
      return false
    end
  end
end
