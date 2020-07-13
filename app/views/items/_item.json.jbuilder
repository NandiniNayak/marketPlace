json.extract! item, :id, :title, :description, :breed_id, :sex, :price, :deposit, :city, :state, :date_of_birth, :diet, :created_at, :updated_at
json.url item_url(item, format: :json)
