class Product < ApplicationRecord
  belongs_to :user
  belongs_to :company
  belongs_to :category
  has_one_attached :image
  has_many :comments, as: :commentable
  has_many :favorites
  has_many :users, through: :favorites
  has_many :reports, as: :reportable

  validates :name, :description, :price, presence: true

  enum status: {available: 0, suspended: 10, disabled: 20}

  def self.available_products(user)
    where(company: user.company).available
  end

  def self.search(product)
    where('name like ? or description like ?', "%#{product}%", "%#{product}%")
  end

  def self.search_category(category_id)
    where(category_id: category_id)
  end
end
