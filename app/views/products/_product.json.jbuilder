json.extract! product, :id, :name, :price, :quantity, :description, :category, :brand, :visible, :created_at, :updated_at
json.url product_url(product, format: :json)
