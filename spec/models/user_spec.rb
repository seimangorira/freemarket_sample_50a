require 'rails_helper'

describe User do
    describe '#create' do
    it "nickname、first_name、first_name_kana、last_name、last_name_kana、email、passwordとpassword_confirmationが存在すれば登録できる" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "nicknameが空では登録できない" do
      expect(FactoryBot.build(:user, nickname: "")).to_not be_valid
    end

    it "first_nameが空では登録できない" do
      expect(FactoryBot.build(:user, first_name: "")).to_not be_valid
    end

    it "first_name_kanaが空では登録できない" do
      expect(FactoryBot.build(:user, first_name_kana: "")).to_not be_valid
    end

    it "last_nameが空では登録できない" do
      expect(FactoryBot.build(:user, last_name: "")).to_not be_valid
    end

    it "last_name_kanaが空では登録できない" do
      expect(FactoryBot.build(:user, last_name_kana: "")).to_not be_valid
    end

    it "emailが空では登録できない" do
      expect(FactoryBot.build(:user, email: "")).to_not be_valid
    end

    it "passwordが空では登録できない" do
      expect(FactoryBot.build(:user, password: "")).to_not be_valid
    end

    it "passwordが存在してもpassword_confirmationが空では登録できない" do
      expect(FactoryBot.build(:user, password_confirmation: "")).to_not be_valid
    end

    it "重複したemailが存在する場合登録できない" do
      user1 = FactoryBot.create(:user, nickname: "菅田将暉", email: "sudamasaki@gmail.com")
      expect(FactoryBot.build(:user, nickname: "ziro", email: user1.email)).to_not be_valid
    end

    it "passwordが6文字以下であれば登録できない" do
      expect(FactoryBot.build(:user, password: "0000", password_confirmation: "0000")).to_not be_valid
    end
  end
end