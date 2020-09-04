class Order < ApplicationRecord
  belongs_to :product
  belongs_to :buyer, class_name: 'User', foreign_key: :buyer_id
  belongs_to :seller, class_name: 'User', foreign_key: :seller_id
  enum status: {in_progress: 0, canceled: 10, concluded: 20}
end
