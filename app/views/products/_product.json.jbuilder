json.extract! product, :id, :name, :brief, :description, :buylink, :verdict, :category_id, :created_at, :updated_at
json.url product_url(product, format: :json)