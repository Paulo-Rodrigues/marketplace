require 'rails_helper'

RSpec.describe Report, type: :model do
  context 'associations' do
    it {is_expected.to belong_to(:reportable)}
    it {is_expected.to belong_to(:user)}
  end
end
