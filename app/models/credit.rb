require 'digest'

class Credit < ApplicationRecord
  has_and_belongs_to_many :credit_transactions
  belongs_to :account

  after_initialize :init_credit

  def init_credit
    self[:fingerprint] = Credit.generate_fingerprint
  end

  def self.generate_fingerprint
    while true
      token = Digest::SHA256.hexdigest Time.now.tv_nsec.to_s + rand.to_s
      return token unless Credit.exists?(:fingerprint => "#{token}")
    end
  end

  def value
    return 1
  end

  def value=
  end

end
