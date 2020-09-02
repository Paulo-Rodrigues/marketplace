class User < ApplicationRecord
  belongs_to :company
  has_many :products, dependent: :destroy
  has_many :comments, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  before_validation :set_company

  def has_full_profile?
    name.present? && surname.present? && department.present?
  end

  private
  def set_company
    existent_company = Company.find_by(name: company_name)
    self.company = existent_company || Company.create(name: company_name)
  end

  def company_name
    email.split('@')[1].split('.')[0].capitalize
  end

  def self.retrieve_company_users(user)
    where(company: user.company) - where(id: user.id)
  end
end
