require 'rails_helper'

describe Identity do
  describe '#create' do


    it "is invalid without a firstname" do
      identity = build(:identity, firstname: nil)
      identity.valid?
      expect(identity.errors[:firstname]).to include("を入力してください")
    end

    it "is invalid without a familyname" do
      identity = build(:identity, familyname: nil)
      identity.valid?
      expect(identity.errors[:familyname]).to include("を入力してください")
    end

    it "is invalid without a familyname_kana" do
      identity = build(:identity, familyname_kana: nil)
      identity.valid?
      expect(identity.errors[:familyname_kana]).to include("を入力してください")
    end

    it "is invalid without a firstname_kana" do
      identity = build(:identity, firstname_kana: nil)
      identity.valid?
      expect(identity.errors[:firstname_kana]).to include("を入力してください")
    end

    it "is invalid without a birthday" do
      identity = build(:identity, birthday: nil)
      identity.valid?
      expect(identity.errors[:birthday]).to include("を入力してください")
    end

  end
end