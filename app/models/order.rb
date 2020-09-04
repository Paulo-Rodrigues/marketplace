class Order < ApplicationRecord
  belongs_to :product
  enum status: {in_progress: 0, canceled: 10, concluded: 20}
end
