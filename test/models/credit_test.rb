require 'test_helper'

class CreditTest < ActiveSupport::TestCase
  test "generate a fingerprint" do
    fingerprint = Credit.generate_fingerprint

    assert fingerprint
  end

  test "ensure fingerprint is unique" do
    fingerprint = Credit.generate_fingerprint
    user = Credit.find_by_fingerprint(fingerprint)

    assert user.nil?
  end

  test "new credit should have fingerprint" do
    credit = Credit.new()
    assert !credit[:fingerprint].blank?
  end
end
