class Product < ApplicationRecord
  belongs_to :user
  belongs_to :company
  has_one_attached :image
  has_many :comments, as: :commentable

  validates :name, :description, presence: true

  def self.search(product_name)
    where('name like ?', "%#{product_name}%")
  end
end
