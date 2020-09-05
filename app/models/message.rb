class Message < ApplicationRecord
  belongs_to :user
  belongs_to :order

  validates :text, presence: true
end
