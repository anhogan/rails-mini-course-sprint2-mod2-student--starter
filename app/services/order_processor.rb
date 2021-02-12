class OrderProcessor
  def initialize(order)
    @order = order
    @product = order.products
  end

  def ship
    if products_available?
      @product.each { |item| item.reduce_inventory }
      @order.ship
    else
      return false
    end
  end

  private
  def products_available?
    @products.all? { |product| product.available? }
  end
end