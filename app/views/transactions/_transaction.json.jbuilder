json.extract! transaction, :id, :sender_id, :recipient_id, :chain_hash, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
