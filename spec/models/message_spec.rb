require 'rails_helper'

RSpec.describe Message, type: :model do
  context 'validations' do
    it {is_expected.to validate_presence_of(:text)}
  end

  context 'associations' do
    it {is_expected.to belong_to(:user)}
    it {is_expected.to belong_to(:order)}
  end
end
