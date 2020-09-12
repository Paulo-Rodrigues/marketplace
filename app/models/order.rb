class Order < ApplicationRecord
  belongs_to :product
  belongs_to :buyer, class_name: 'User', foreign_key: :buyer_id
  belongs_to :seller, class_name: 'User', foreign_key: :seller_id

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
