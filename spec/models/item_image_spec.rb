require 'rails_helper'

describe '画像が存在する' do
  it "商品出品時に画像があれば出品できる" do
    @item_image = build(:item_image01)
    expect(@item_image).to be_valid
  end

  it "商品出品時に画像が無いと出品できない" do
    @item_image = ItemImage.new(image: nil)
    expect(@item_image.valid?).to eq(false)
  end

end