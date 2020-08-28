require 'rails_helper'

RSpec.describe User, type: :model do
  context 'respond_to' do
    it {is_expected.to respond_to(:email)}
    it {is_expected.to respond_to(:password)}
    it {is_expected.to respond_to(:company)}
    it {is_expected.to respond_to(:name)}
    it {is_expected.to respond_to(:surname)}
    it {is_expected.to respond_to(:department)}
  end

  context 'callbacks' do
    it {is_expected.to callback(:set_company).before(:validation)}
  end
end
