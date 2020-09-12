require 'rails_helper'

describe Admin, type: :model do
  context 'respond_to' do
    it {is_expected.to respond_to(:type)}
  end

  context 'type' do
    it 'is admin' do
      admin = Admin.create!(email: 'admin@email.com', password: 'password')

      expect(admin.type).to eq('Admin')
    end
  end
end
