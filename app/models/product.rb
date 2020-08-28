class Product < ApplicationRecord
  belongs_to :user
  belongs_to :company

  validates :name, :description, presence: true
end
