require 'rails_helper'

describe Item do
  describe '#create' do

    # factrybotが作れていること
    it "is invalid " do
      item = create(:item)
      item.valid?
      expect(item).to be_valid
    end
    # nameが空欄だと保存できないこと
    it "is invalid without a name" do
      item = build(:item, name: "")
      item.valid?
      expect(item.errors[:name]).to include("can't be blank")
    end
    # # priceが空欄だと保存できないこと
    it "is invalid without a price" do
      item = build(:item, price: "")
      item.valid?
      expect(item.errors[:price]).to include("can't be blank")
    end
    # brandが空欄でも保存できる
    it "is valid without a brand" do
      item = create(:item, brand_id: "")
      item.valid?
      expect(item).to be_valid
    end
    # sizeが空欄でも保存できる
    it "is valid without a size" do
      item = create(:item, size_id: "")
      item.valid?
      expect(item).to be_valid
    end
    # priceが299以下であれば登録出来ないこと
    it "is invalid with a price that is less than 299 " do
      item = build(:item, price: "299")
      item.valid?
      expect(item.errors[:price]).to include("must be greater than or equal to 300")
    end
    # priceが300以上であれば登録出来ること
    it "is valid with a price that is more than 300" do
      item = create(:item, price: "300")
      item.valid?
      expect(item).to be_valid
    end
    # priceが1000000以上であれば登録出来ないこと
    it "is invalid with a price that is more than 1000000" do
      item = build(:item, price: "1000000")
      item.valid?
      expect(item.errors[:price]).to include("must be less than or equal to 999999")
    end
    # priceが999999以下であれば登録出来ること
    it "is valid with a price that is less than 999999" do
      item = create(:item, price: "999999")
      item.valid?
      expect(item).to be_valid
    end

  end
end