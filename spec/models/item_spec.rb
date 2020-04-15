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
  
  it "商品出品時にnameがなければ無効" do
    @item = Item.new(name: nil)
    expect(@item.valid?).to eq(false)
  end
  
  it "商品出品時にintroductionがなければ無効" do
    @item = Item.new(introduction: nil)
    expect(@item.valid?).to eq(false)
  end
  
  it "商品出品時にpriceがなければ無効" do
    @item = Item.new(price: nil)
    expect(@item.valid?).to eq(false)
  end

  it "商品出品時にcategory_idがなければ無効" do
    @item = Item.new(category_id: nil)
    expect(@item.valid?).to eq(false)
  end

  it "商品出品時にstatusがなければ無効" do
    @item = Item.new(status: nil)
    expect(@item.valid?).to eq(false)
  end

  it "商品出品時にpreparation_dayがなければ無効" do
    @item = Item.new(preparation_day: nil)
    expect(@item.valid?).to eq(false)
  end

  it "商品出品時にexhibitor_idがなければ無効" do
    @item = Item.new(exhibitor_id: nil)
    expect(@item.valid?).to eq(false)
  end

