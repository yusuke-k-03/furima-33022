require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  context "商品出品が可能な時" do
    it "商品名、画像、説明、カテゴリー、状態、送料、地域、日数、価格が全て入力された時" do
      expect(@item).to be_valid
    end

    it "金額の範囲が300〜9999999で半角数字の入力された時" do
      @item.price = "3000"
      expect(@item).to be_valid
    end

  end

  context "商品出品が不可能な時" do
    it "商品名が空では出品できない" do
      @item.name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end


    it "画像が空では出品できない" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it "商品の詳細が空では出品できない" do
      @item.info = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Info can't be blank")
    end

    it "カテゴリーで「ーー」では出品できない" do
      @item.category_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end

    it "商品の状態で「ーー」では出品できない" do
      @item.sale_status_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Sale status must be other than 1")
    end

    it "送料負担で「ーー」では出品できない" do
      @item.shipping_fee_status_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping fee status must be other than 1")
    end

    it "発送地域で「ーー」では出品できない" do
      @item.prefecture_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
    end

    it "発送日数が「ーー」では出品できない" do
      @item.scheduled_delivery_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Scheduled delivery must be other than 1")
    end

    it "価格が300円未満だと出品できない" do
      @item.price = "299"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
    end

    it "価格が9,999,999より高いと出品できない" do
      @item.price = "10000000"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
    end

    it "価格は半角数字で入力しないと出品できない" do
      @item.price = "１１１１"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end


  end

end
