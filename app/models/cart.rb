class Cart < ApplicationRecord
  belongs_to :user
  belongs_to :product, :foreign_key => "product_id"
end
