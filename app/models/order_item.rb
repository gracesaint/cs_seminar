class OrderItem < ApplicationRecord
    belongs_to :order
    belongs_to :product
    
    validates :order_id, :product, presence: true
    validates :product_id, presence: true
    
    validates :quantity, numericality: {greater_than_or_equal_to: 0}
    
    def subtotal
      quantity.to_i * product.price
    end
   
end
