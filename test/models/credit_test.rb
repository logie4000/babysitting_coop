require 'test_helper'

class CreditTest < ActiveSupport::TestCase
  test "generate a fingerprint" do
    fingerprint = User.generate_fingerprint

    assert fingerprint
  end

  test "ensure fingerprint is unique" do
    fingerprint = User.generate_fingerprint
    user = User.find_by_fingerprint(fingerprint)

    assert user.nil?
  end
end
