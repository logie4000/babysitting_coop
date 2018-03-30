require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "new user should have figreprint" do
    user = User.new
    assert !user[:fingerprint].blank?
  end
end
