require 'rails_helper'

RSpec.describe Company, type: :model do
  context 'respond_to' do
    it {is_expected.to respond_to(:name)}
  end

  context 'associations' do
    it {is_expected.to have_many(:users).dependent(:destroy)}
    it {is_expected.to have_many(:products).dependent(:destroy)}
  end
end
