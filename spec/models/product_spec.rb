require 'rails_helper'

RSpec.describe Product, type: :model do
  context 'respond_to' do
    it {is_expected.to respond_to(:name)}
    it {is_expected.to respond_to(:description)}
    it {is_expected.to respond_to(:image)}
    it {is_expected.to respond_to(:price)}
    it {
      is_expected.to define_enum_for(:status)
        .with_values(available: 0, suspended: 10, disabled: 20)
    }
  end

  context 'active storage' do
    it 'with image attached' do
      product = create(:product)
      product.image.attach(create_file_blob)

      expect(product.image.present?).to eq(true)
    end
  end

  context 'validations' do
    it {is_expected.to validate_presence_of(:name)}
    it {is_expected.to validate_presence_of(:description)}
    it {is_expected.to validate_presence_of(:price)}
  end

  context 'associations' do
    it {is_expected.to belong_to(:user)}
    it {is_expected.to belong_to(:company)}
    it {is_expected.to have_many(:comments)}
    it {is_expected.to belong_to(:category)}
    it {is_expected.to have_many(:favorites)}
    it {is_expected.to have_many(:users).through(:favorites)}
    it {is_expected.to have_many(:reports)}
  end
end
