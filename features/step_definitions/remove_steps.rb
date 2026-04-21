When('I visit the cart page') do
  visit '/cart.html'
end

When('I remove the {string} from my cart') do |product_name|
    @cart_page = CartPage.new #cria o objeto
    @cart_page.remove_product(product_name) #chama a ação
end

Then('the shopping cart badge should not be visible') do
    #valiida que o produto não esta no carrinho se 
    # se retornar TRUE o teste falha
    expect(@cart_page.has_product?('MochilaSauce Labs Backpack')). to be false
end