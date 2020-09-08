require 'rails_helper'

RSpec.describe Favorite, type: :model do
  context 'associations' do
    it {is_expected.to belong_to(:user)}
    it {is_expected.to belong_to(:product)}
  end
end
