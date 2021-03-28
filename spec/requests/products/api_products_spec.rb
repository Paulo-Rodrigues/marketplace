require 'rails_helper'

describe 'Products api' do
  context 'index' do
    it 'list of products' do
      products = create_list(:product, 3)

      get '/api/v1/products'

      expect(response).to have_http_status(:ok)
      expect(response.body).to include(products[0].name)
    end

    it 'list of available products only' do
      products = create_list(:product, 3)
      product = create(:product, name: 'Unavailable', status: :suspended)

      get '/api/v1/products'

      expect(response).to have_http_status(:ok)
      expect(response.body).to include(products[0].name)
      expect(response.body).not_to include(product.name)
    end
  end

  context 'show' do
    it 'product details' do
      product = create(:product)

      get "/api/v1/products/#{product.id}"

      puts response.body

      expect(response).to have_http_status(:ok)
      expect(response.body).to include(product.name)
      expect(response.body).to include(product.status)
      expect(response.body).to include(product.price.to_s)
      expect(response.body).to include(product.description)
      expect(response.body).to include(product.user_id.to_s)
      expect(response.body).to include(product.user.email)
    end
  end
end
