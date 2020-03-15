require 'test_helper'

class PurchaseControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get purchase_index_url
    assert_response :success
  end

  test "should get pay" do
    get purchase_pay_url
    assert_response :success
  end

end
