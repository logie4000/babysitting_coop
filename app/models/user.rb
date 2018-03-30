require 'digest'

class User < ApplicationRecord
  has_one :account
  has_many :credits, through: :account

  validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :message => "must be a valid email format!" }

  after_initialize :init_user

  def init_user
    self[:fingerprint] = User.generate_fingerprint if (self[:fingerprint].blank?)
    self[:api_key] = User.generate_api_key if (self[:api_key].blank?)
  end

  def self.generate_fingerprint
    while true
      token = Digest::SHA256.hexdigest Time.now.tv_nsec.to_s + rand.to_s
      return token unless User.exists?(:fingerprint => "#{token}")
    end
  end

  def self.generate_api_key
    while true
      token = Digest::MD5.hexdigest Time.now.tv_nsec.to_s + rand.to_s
      return token unless User.exists?(:api_key => "#{token}")
    end
  end  
end
