require('spec_helper')

describe('shoe brand functionality through application', {:type => :feature}) do
  it('1: allows a user to add a new shoe brand with price') do
    visit('/')
    click_link('View Shoe Brands')
    fill_in('brand_name', :with => "Adidas Kampung")
    fill_in('brand_price', :with => "22.99")
    click_button('Add Brand')
    expect(page).to have_content('Adidas Kampung - $22.99')
  end
  it('2: allows a user to add a new store and capitalize first letter of word') do
    visit('/')
    click_link('View Stores')
    fill_in('store_name', :with => "fashion feet")
    click_button('Add Store')
    expect(page).to have_content('Fashion Feet')
  end
end
