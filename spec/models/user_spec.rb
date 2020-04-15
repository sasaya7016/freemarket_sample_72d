require 'rails_helper'

describe User do
  describe '#create' do

    it "nickname、firstname,lastname,firstnameKANA,lastnameKANA,birth_date,email、passwordとpassword_confirmationが存在すれば登録できること" do
      user = build(:user)
      except(user).to be_valid
    end

    it "nicknameがない場合は登録できない" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    it "lastnameがない場合は登録できない" do
      user = build(:user, lastname: "")
      user.valid?
      expect(user.errors[:lastname]).to include("can't be blank")
    end

    it "firstnameがない場合は登録できない" do
      user = build(:user, firstname: "")
      user.valid?
      expect(user.errors[:firstname]).to include("can't be blank")
    end

    it "lastnameKANAがない場合は登録できない" do
      user = build(:user, lastnameKANA: "")
      user.valid?
      expect(user.errors[:lastnameKANA]).to include("can't be blank")
    end

    it "firstnameKANAがない場合は登録できない" do
      user = build(:user, firstnameKANA: "")
      user.valid?
      expect(user.errors[:firstnameKANA]).to include("can't be blank")
    end

    it "birth_dateがない場合は登録できない" do
      user = build(:user, birth_date: "")
      user.valid?
      expect(user.errors[:birth_date]).to include("can't be blank")
    end

    it "emailがない場合は登録できない" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "emailに@がない場合は登録できない" do
      user = build(:user, email:mmmgmail.com)
      user.valid?
      expect(user.errors[:email]).to include("is invalid")
    end

    it "passwordがない場合は登録できない" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    it "password_confirmationがない場合は登録できない" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("can't be blank")
    end

    it "重複したemailが存在する場合は登録できない" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end

    it "passwordが７文字以上であれば登録できる" do
      user = build(:user, password: "0000000", password_confirmation: "0000000")
      user.valid?
      expect(user).to be_valid
    end

    it "passwordが6文字以下であれば登録できない" do
      user = build(:user, password: "000000", password_confirmation: "000000")
      user.valid?
      expect(user.errors[:password]).to include("is too short(minimum is 7 characters)")
    end
  end
end