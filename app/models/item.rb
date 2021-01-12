class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one :record
  has_one_attached :image
  belongs_to :category
  belongs_to :sale_status
  belongs_to :shipping_fee_status
  belongs_to :prefecture
  belongs_to :scheduled_delivery


  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :shipping_fee_status_id
    validates :sale_status_id
    validates :prefecture_id
    validates :scheduled_delivery_id
  end

  with_options presence: true do
    validates :image
    validates :name
    validates :info
    validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  end

end
