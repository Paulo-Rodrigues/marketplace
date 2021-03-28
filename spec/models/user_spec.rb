require 'rails_helper'

RSpec.describe User, type: :model do
  context 'respond_to' do
    it { is_expected.to respond_to(:email) }
    it { is_expected.to respond_to(:password) }
    it { is_expected.to respond_to(:company) }
    it { is_expected.to respond_to(:name) }
    it { is_expected.to respond_to(:surname) }
    it { is_expected.to respond_to(:department) }
    it { is_expected.to respond_to(:has_full_profile?) }
    it { is_expected.to respond_to(:avatar) }
  end

  context 'callbacks' do
    it { is_expected.to callback(:set_company).before(:validation) }
  end

  context 'associations' do
    it { is_expected.to have_many(:products).dependent(:destroy) }
    it { is_expected.to have_many(:comments).dependent(:destroy) }
    it { is_expected.to have_many(:messages).dependent(:destroy) }
    it { is_expected.to have_many(:notifications).dependent(:destroy) }
    it { is_expected.to have_many(:favorites) }
    it { is_expected.to have_many(:reports).dependent(:destroy) }
  end

  context 'custom methods' do
    it '#profile? (false)' do
      user = create(:user)

      expect(user.has_full_profile?).to be_falsey
    end

    it 'full_profile? (true)' do
      user = create(:user_with_profile)

      expect(user.has_full_profile?).to be_truthy
    end
  end
end
