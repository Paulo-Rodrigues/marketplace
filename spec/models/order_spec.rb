require 'rails_helper'

RSpec.describe Order, type: :model do
  context 'validations' do
    it {is_expected.to define_enum_for(:status).with_values(in_progress: 0, canceled: 10, concluded: 20)}
  end

  context 'associations' do
    it {is_expected.to belong_to(:product)}
    it {is_expected.to belong_to(:buyer)}
    it {is_expected.to belong_to(:seller)}
    it {is_expected.to have_many(:messages).dependent(:destroy)}
  end
end
