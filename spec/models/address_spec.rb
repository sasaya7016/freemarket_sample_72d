require 'rails_helper'
describe Address do
  describe '#create' do
    it "postalcode, prefecture_id, first_address, second_addressがある場合登録できる"　do
      user = build(:user)
      address = build(:address)
      expect(address).to be valid
    end

    it "郵便番号がない場合登録できない" do
      address = build(:address, postalcode: "")
      address.valid?
      expect(address.errors[:postalcode]).to include("can't be blank")
    end

    it "都道府県を選択していない場合登録できない" do
      address = build(:address, prefecture_id:"")
      address.valid?
      expect(address.errors[:prefecture_id]).to include("can't be blank")
    end

    it "first_addressがない場合登録できない" do
      address = build(:address, first_address:"")
      address.valid?
      expect(address.errors[:first_address]).to include("can't be blank")
    end

    it "second_addressがない場合登録できない" do
      address = build(:address, second_address:"")
      address.valid?
      expect(address.errors[:second_address]).to include("can't be blank")
    end
  end
end