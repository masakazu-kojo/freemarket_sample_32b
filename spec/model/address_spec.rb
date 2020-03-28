require 'rails_helper'

describe Address do
  describe '#create' do

    it "is invalid without a send_firstname" do
      address = build(:address, send_firstname: nil)
      address.valid?
      expect(address.errors[:send_firstname]).to include("を入力してください")
    end

    it "is invalid without a send_familyname" do
      address = build(:address, send_familyname: nil)
      address.valid?
      expect(address.errors[:send_familyname]).to include("を入力してください")
    end

    it "is invalid without a fsend_amilyname_kana" do
      address = build(:address, send_familyname_kana: nil)
      address.valid?
      expect(address.errors[:send_familyname_kana]).to include("を入力してください")
    end

    it "is invalid without a send_firstname_kana" do
      address = build(:address, send_firstname_kana: nil)
      address.valid?
      expect(address.errors[:send_firstname_kana]).to include("を入力してください")
    end

    it "is invalid without a postal_code" do
      address = build(:address, postal_code: nil)
      address.valid?
      expect(address.errors[:postal_code]).to include("を入力してください")
    end

    it "is invalid without a prefecture" do
      address = build(:address, prefecture: nil)
      address.valid?
      expect(address.errors[:prefecture]).to include("を入力してください")
    end

    it "is invalid without a municipality" do
      address = build(:address, municipality: nil)
      address.valid?
      expect(address.errors[:municipality]).to include("を入力してください")
    end

    it "is invalid without a house_number" do
      address = build(:address, house_number: nil)
      address.valid?
      expect(address.errors[:house_number]).to include("を入力してください")
    end



  end
end