require 'test_helper'

class CreditTransactionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @credit_transaction = credit_transactions(:one)
  end

  test "should get index" do
    get credit_transactions_url
    assert_response :success
  end

  test "should get new" do
    get new_credit_transaction_url
    assert_response :success
  end

  test "should create credit_transaction" do
    assert_difference('CreditTransaction.count') do
      post credit_transactions_url, params: { credit_transaction: {  } }
    end

    assert_redirected_to credit_transaction_url(CreditTransaction.last)
  end

  test "should show credit_transaction" do
    get credit_transaction_url(@credit_transaction)
    assert_response :success
  end

  test "should get edit" do
    get edit_credit_transaction_url(@credit_transaction)
    assert_response :success
  end

  test "should update credit_transaction" do
    patch credit_transaction_url(@credit_transaction), params: { credit_transaction: {  } }
    assert_redirected_to credit_transaction_url(@credit_transaction)
  end

  test "should destroy credit_transaction" do
    assert_difference('CreditTransaction.count', -1) do
      delete credit_transaction_url(@credit_transaction)
    end

    assert_redirected_to credit_transactions_url
  end
end
