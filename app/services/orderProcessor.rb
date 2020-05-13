class OrderProcessor
  def initialize(order)
    @order = order
    @product = @order.products
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
    inventory = @product.select { |item| item.inventory > 0 }

    if inventory.length == @product.length
      return inventory
  end
end