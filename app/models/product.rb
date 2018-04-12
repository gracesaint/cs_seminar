class Product < ApplicationRecord
    validates_numericality_of :price
    validates :stock, numericality: {greater_than_or_equal_to: 0}
    has_many :order_items
    accepts_nested_attributes_for :order_items
    
    has_many :reviews

    
    def self.search(search)
        where("title Like ?", "%#{search}%")
        where("color Like ?", "%#{search}%")
        where("size Like ?", "%#{search}%")
    end


end
