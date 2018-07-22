require('spec_helper')

describe('shoe brand functionality through application', {:type => :feature}) do
  it('allows a user to add a new shoe brand with price') do
    visit('/')
    click_link('View Shoe Brands')
    fill_in('brand_name', :with => "Adidas Kampung")
    fill_in('brand_price', :with => "22.99")
    click_button('Add Brand')
    expect(page).to have_content('Adidas Kampung - $22.99')
  end
end
