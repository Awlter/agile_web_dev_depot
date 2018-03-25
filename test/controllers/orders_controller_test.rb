require 'test_helper'

class OrdersControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  setup do
    @order = orders(:one)
  end
  test "requires item in cart" do
    get new_order_url
    assert_redirected_to store_index_path
    assert_equal flash[:notice], "Your cart is empty."
  end

  test "should create order" do
    assert_difference('Order.count') do
      post orders_url, params: { order: { name: @order.name, email: @order.email, address: @order.address, pay_type: @order.pay_type }}
    end

    assert_redirected_to store_index_path
  end
end
