class Order < ApplicationRecord
  belongs_to :product
  belongs_to :buyer, class_name: 'User', foreign_key: :buyer_id
  belongs_to :seller, class_name: 'User', foreign_key: :seller_id
  has_many :messages, dependent: :destroy
  enum status: {in_progress: 0, canceled: 10, concluded: 20}

  scope :user_orders, -> (user) { where(buyer: user) + Order.where(seller: user) }

  before_create :disable_product
  before_update :alter_product_status
  after_save :send_notification

  private

  def send_notification
    Notification.create!(user: self.seller, body: notification_text)
  end

  def notification_text
    "Novo pedido em <a href='/orders/#{id}'>pedido</a> "
  end

  def disable_product
    product.disabled!
  end

  def alter_product_status
    if self.status == 'canceled'
      product.available!
    end
  end
end
