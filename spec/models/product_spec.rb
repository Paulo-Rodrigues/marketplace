require 'rails_helper'

RSpec.describe Product, type: :model do
  context 'respond_to' do
    it {is_expected.to respond_to(:name)}
    it {is_expected.to respond_to(:description)}
  end

  context 'validations' do
    it {is_expected.to validate_presence_of(:name)}
    it {is_expected.to validate_presence_of(:description)}
  end

  context 'associations' do
    it {is_expected.to belong_to(:user)}
    it {is_expected.to belong_to(:company)}
  end
end
