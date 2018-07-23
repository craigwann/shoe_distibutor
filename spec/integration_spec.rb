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
  it('3: allows a user to add a new store and change/update the name') do
    visit('/')
    click_link('View Stores')
    fill_in('store_name', :with => "twinkle toez")
    click_button('Add Store')
    click_link('Twinkle Toez')
    fill_in('name', :with => "twinkle toes")
    click_button('Update')

    expect(page).to have_content('Twinkle Toes')
  end
  it('4: allows a user to add brand to a store') do
    visit('/')
    click_link('View Shoe Brands')
    fill_in('brand_name', :with => "Comfort Clog")
    fill_in('brand_price', :with => "29.50")
    click_button('Add Brand')
    click_link('View Stores')
    fill_in('store_name', :with => "The Shoebox")
    click_button('Add Store')
    click_link('The Shoebox')

    select('Comfort Clog - $29.50', :from => 'brand_id')
    click_button('Add Shoe')

    expect(page).to have_content('Comfort Clog - $29.50')
  end
end
