require "application_system_test_case"

class OrdersTest < ApplicationSystemTestCase
  test "check routing number" do
    visit store_index_url
  
    first('.catalog li').click_on 'Add to cart'

    click_on 'Checkout'

    fill_in 'order_name', with: 'Walter Wang'
    fill_in 'order_address', with: '123 Main Street'
    fill_in 'order_email', with: 'hehe@example.com'

    assert_no_selector "#order_routing_number"

    select 'Check', from: 'pay_type'

    assert_selector "#order_routing_number"
  end
end
