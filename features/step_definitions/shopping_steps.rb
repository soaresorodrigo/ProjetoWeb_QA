# Given('I am logged in as a {string}') do |user|
#     visit '/'
#     fill_in 'user-name', with: user
# end

When('I add the {string} to my cart') do |product|

    #fill_in 'item_4_title_link', with: product

    click_button 'add-to-cart-sauce-labs-backpack'

end

Then('the shopping cart badge should show {string}') do |quantity|
    sleep 5   
    expect(page).to have_css('.shopping_cart_badge', text: quantity) 

end