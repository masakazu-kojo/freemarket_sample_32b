require 'rails_helper'

describe Identity do
  describe '#create' do



    it "is invalid without a nickname" do
      identity = build(:identity, nickname: nil)
      identity.valid?
      expect(identity.errors[:nickname]).to include("can't be blank")
    end

    #passwordが空では登録できないこと
    it "is invalid without a password" do
      identity = build(:identity, password: nil)
      identity.valid?
      expect(identity.errors[:password]).to include("can't be blank")
    end

    #passwordが存在してもpassword_confirmationが空では登録できないこと
    it "is invalid without a password_confirmation although with a password" do
      identity = build(:identity, password_confirmation: "")
      identity.valid?
      expect(identity.errors[:password_confirmation]).to include("doesn't match Password")
    end

    #passwordが7文字以上であれば登録できないこと
    it "is invalid with a password that has more than 7 characters " do
      identity = build(:identity, password: "aaaaaaaa")
      identity.valid?
      expect(identity.errors[:password]).to include("is too long (maximum is 6 characters)")
    end

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