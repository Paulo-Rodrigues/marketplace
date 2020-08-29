class Product < ApplicationRecord
  belongs_to :user
  belongs_to :company
  has_one_attached :image

  validates :name, :description, presence: true
end
