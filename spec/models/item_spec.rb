require 'rails_helper'

describe 'presence: true' do
  it "商品出品時にname, introduction, price, category_id, status, preparation_day, exhibitor_id, delivery_fee, prefecture_idがあれば有効であること" do
    @item = Item.new(
      id: 123,
      name: "music",
      introduction: "This is the test.",
      price: 99999,
      category_id: 3,
      status: "未使用",
      preparation_day: 2,
      exhibitor_id: 1,
      delivery_fee: "着払い（購入者負担）",
      prefecture_id: 1,
    )
    expect(@item).to be_valid
  end
