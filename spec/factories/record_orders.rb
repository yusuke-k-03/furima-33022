FactoryBot.define do
  factory :record_order do
    user_id               { 1 }
    item_id               { 1 }
    postal_code           { '111-1111' }
    prefecture_id         { 2 }
    city                  { 'test' }
    addresses             { 'test' }
    building              { 'test' }
    phone_number          { '1234567890' }
    token                 { 'tok_abcdefghijk00000000000000000' }
  end
end
