require 'test_helper'

class AccountTest < ActiveSupport::TestCase
  test "new account should have fingerprint" do
    account = Account.new()
    assert !account[:fingerprint].blank?
  end
end
