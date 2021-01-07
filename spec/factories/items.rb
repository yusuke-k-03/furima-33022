FactoryBot.define do
  factory :item do
    name {"test"}
    item {"spec/test_image.jpg"}
    category_id {"2"}
    sale_status_id {"2"}
    shipping_fee_status_id {"2"}
    prefecture_id {"2"}
    scheduled_delivery_id {"2"}
    price {"2"}
  end
end
