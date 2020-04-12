require 'rails_helper'
describe CreditCard do
  describe '#create' do
    it "user_idとcard_idとcustomer_idが存在すれば登録できること" do
      card = FactoryBot.build(:credit_card)
      expect(card).to be_valid
    end
  end
end
describe CreditCard do
  describe '#create' do
    it "user_idがない時に登録できないこと" do
      card = CreditCard.new(user_id: "",card_id: "car_bdb3f5e8c896b05cf7e916819c20", customer_id:"cus_a25d58a7e24a5010427f476c4837")
      card.valid?
      expect(card.errors[:user_id]).to include("can't be blank")
    end
  end
end
describe CreditCard do
  describe '#create' do
    it "card_idがない時に登録できないこと" do
      card = CreditCard.new(user_id: "1",card_id: "", customer_id:"cus_a25d58a7e24a5010427f476c4837")
      card.valid?
      expect(card.errors[:card_id]).to include("can't be blank")
    end
  end
end
describe CreditCard do
  describe '#create' do
    it "customer_idがない時に登録できないこと" do
      card = CreditCard.new(user_id: "1",card_id: "car_bdb3f5e8c896b05cf7e916819c20", customer_id:"")
      card.valid?
      expect(card.errors[:customer_id]).to include("can't be blank")
    end
  end
end