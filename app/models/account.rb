class Account < ApplicationRecord
  belongs_to :owner, :class_name => 'User'
  has_many :credits

  after_initialize :init_account

  def init_account
    self[:fingerprint] = User.generate_fingerprint if (self[:fingerprint].blank?)
  end

  def owner_name
    if (owner)
      return "#{owner.first_name} #{owner.last_name}"
    end
  end
end
