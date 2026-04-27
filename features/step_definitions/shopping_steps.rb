# Given('I am logged in as a {string}') do |user|
#     visit '/'
#     fill_in 'user-name', with: user
# end

When('I add the {string} to my cart') do |product|

    product_id = product.downcase.gsub(' ', '-')
    click_button "add-to-cart-#{product_id}"

end

Then('the shopping cart badge should show {string}') do |quantity|
    expect(page).to have_css('.shopping_cart_badge', text: quantity) 

end