module ProductsHelper
    def print_price(price)
        number_to_currency price
    end
    
    def price=(input)
      input.delete!("$")
      super
    end
    
    def print_stock(stock, requested = 1)
        if stock > requested
            content_tag :span, class: "in_stock" do
                #{stock}
            end
        elsif stock < 0
            content_tag :span, class: "out_of_stock" do
                "out of stock"
            end
        elsif stock > 0 && stock < requested
            content_tag(:span, "Insufficient stock", class: "low_stock") do
                #{stock}
            end
        end
    end
end
