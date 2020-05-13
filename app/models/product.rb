class Product < ApplicationRecord
  def available?
    @product = Product.find(params[:id])
    
    if @product.("inventory > ?", 0)
      return true
    end
  end

  def reduce_inventory
    @product = Product.find(params[:id])

    @product(inventory: @product.inventory - 1)
  end
end
