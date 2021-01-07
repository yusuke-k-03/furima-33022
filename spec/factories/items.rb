FactoryBot.define do
  factory :item do
    name                      {"test"}
    info                      {"test"}
    image                     {Rack::Test::UploadedFile.new(File.join(Rails.root, 'app/assets/images/test-image.jpg'))}
    category_id               {"2"}
    sale_status_id            {"2"}
    shipping_fee_status_id    {"2"}
    prefecture_id             {"2"}
    scheduled_delivery_id     {"2"}
    price                     {"3000"}
    association :user
  end
  
end
