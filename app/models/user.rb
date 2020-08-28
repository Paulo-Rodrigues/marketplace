class User < ApplicationRecord
  belongs_to :company
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  before_validation :set_company

  private
  def set_company
    existent_company = Company.find_by(name: company_name)
    self.company = existent_company || Company.create(name: company_name)
  end

  def company_name
    email.split('@')[1].split('.')[0].capitalize
  end
end
