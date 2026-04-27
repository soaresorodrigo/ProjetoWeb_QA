When('I visit the cart page') do
  visit '/cart.html'
end

When('I remove the {string} from my cart') do |product_name|
  @product_name = product_name  # ← salva para o Then usar
  @cart_page = CartPage.new
  @cart_page.remove_product(product_name)
end

Then('the shopping cart badge should not be visible') do
  @cart_page ||= CartPage.new
  expect(@cart_page.has_product?(@product_name)).to be false  # ← argumento + lógica correta
end