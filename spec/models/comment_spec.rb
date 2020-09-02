require 'rails_helper'

RSpec.describe Comment, type: :model do
  context 'respond_to' do
    it {is_expected.to respond_to(:body)}
  end

  context 'validations' do
    it {is_expected.to validate_presence_of(:user)}
    it {is_expected.to validate_presence_of(:commentable)}
  end

  context 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:commentable) }
  end
end
