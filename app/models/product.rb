class Product < ApplicationRecord
    validates_numericality_of :price
    validates :stock, numericality: {greater_than_or_equal_to: 0}
    
    has_many :order_items
    has_many :reviews
    
   # searchable do
#%        text :name, :description
  #  end
    
    
    
    def self.search(search)
        where("title Like ?", "%#{search}%")
        where("color Like ?", "%#{search}%")
        where("size Like ?", "%#{search}%")
    end
    
#    def self.search(keyword, params = {})
#%      params.update(:keyword => keyword)
#%      self.find_all_by_method('search', params)
#%    end
    
    # Search for users with given keyword and color
#    def self.search_by_color(color, keyword, params = {})
#5      params.update(:keyword => keyword)
#5      self.find_all_by_hex_search(color, params)
#5    end
    

end
