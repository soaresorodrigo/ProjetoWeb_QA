class CartPage
    include Capybara::DSL

    def initialize
        @cart_item = ".cart_item"
        @remove_button = "Remove"
    end

    def remove_product(name)
        find('.inventory_item_name', text: name).find(:xpath, 'ancestor::div[@class="cart_item"]').click_button('Remove')
        
    end


    def has_product?(name)
        has_css?('.inventory_item_name', text: name)    
    end
end