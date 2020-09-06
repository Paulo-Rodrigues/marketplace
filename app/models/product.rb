class Product < ApplicationRecord
  belongs_to :user
  belongs_to :company
  belongs_to :category
  has_one_attached :image
  has_many :comments, as: :commentable

  validates :name, :description, :price, presence: true

  enum status: {available: 0, suspended: 10, disabled: 20}

  def self.available_products(user)
    where(company: user.company).available
  end

  def self.search(product_name)
    where('name like ?', "%#{product_name}%")
  end
end
