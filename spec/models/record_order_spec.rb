require 'rails_helper'

RSpec.describe RecordOrder, type: :model do
  before do
    @record_order = FactoryBot.build(:record_order)
  end

  context "購入可能な時" do
    it "郵便番号、都道府県、市区町村、番地、電話番号がある時" do 
      expect(@record_order).to be_valid
    end

    it "郵便番号でハイフンがある時" do
      @record_order.postal_code = "111-1111"
      expect(@record_order).to be_valid
    end

    it "電話番号が11桁以内である時" do
      @record_order.phone_number = "12345678901"
      expect(@record_order).to be_valid
    end
    
  end

  context "商品購入できないとき" do
    it "郵便番号がからの時" do
      @record_order.postal_code = ""
      @record_order.valid?
      expect(@record_order.errors.full_messages).to include("Postal code can't be blank")
    end

    it "郵便番号にハイフンがないとき" do
      @record_order.postal_code = "1111111"
      @record_order.valid?
      expect(@record_order.errors.full_messages).to include("Postal code is invalid")
    end

    it "郵便番号でハイフンの前後が３桁、４桁でない時" do
      @record_order.postal_code = "11111-11111"
      @record_order.valid?
      expect(@record_order.errors.full_messages).to include("Postal code is invalid")
    end

    it "都道府県がからの時" do
      @record_order.prefecture_id = 1
      @record_order.valid?
      expect(@record_order.errors.full_messages).to include("Prefecture must be other than 1")
    end

    it "市区町村がからの時" do
      @record_order.city = ""
      @record_order.valid?
      expect(@record_order.errors.full_messages).to include("City can't be blank")
    end

    it "番地がからの時" do
      @record_order.addresses = ""
      @record_order.valid?
      expect(@record_order.errors.full_messages).to include("Addresses can't be blank")
    end

    it "電話番号がからの時" do
      @record_order.phone_number = ""
      @record_order.valid?
      expect(@record_order.errors.full_messages).to include("Phone number can't be blank")
    end

    it "電話番号にハイフンが入っている時" do
      @record_order.phone_number = "111-1111-1111"
      @record_order.valid?
      expect(@record_order.errors.full_messages).to include("Phone number is invalid")
    end

    it "電話番号が１１桁いないでない時" do
      @record_order.phone_number = "123456789012"
      @record_order.valid?
      expect(@record_order.errors.full_messages).to include("Phone number is invalid")
    end

  end

end
