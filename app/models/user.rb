class User < ApplicationRecord
  has_one :account
  has_many :credits, through: :account

  validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :message => "must be a valid email format!" }

end
