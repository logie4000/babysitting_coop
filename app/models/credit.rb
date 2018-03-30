class Credit < ApplicationRecord
  has_and_belongs_to_many :transactions
  belongs_to :account

  def generate_fingerprint
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
