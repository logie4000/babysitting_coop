class CreditTransaction < ApplicationRecord
  belongs_to :sender, :class_name => 'Account'
  belongs_to :recipient, :class_name => 'Account'
  has_and_belongs_to_many :credits 

  def to_block
    json = self.to_json
    block = Digest::SHA256.hexdigest(json)
    return block
  end

  def before_create
    if (Transactions.all.count > 0)
      previous = Transactions.all.last
      block = previous.to_block
      self[:chain_hash] = block
    else
      self[:chain_hash] = self.to_block
    end
  end 
end
