class Order < ApplicationRecord
  belongs_to :product
  belongs_to :buyer, class_name: 'User', foreign_key: :buyer_id
  belongs_to :seller, class_name: 'User', foreign_key: :seller_id
  has_many :messages, dependent: :destroy
  enum status: {in_progress: 0, canceled: 10, concluded: 20}

  scope :user_orders, -> (user) { where(buyer: user) + Order.where(seller: user) }
end
