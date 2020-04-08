class ItemsController < ApplicationController
  
  require "payjp"


  def buy #クレジット購入
    @item = Item.find(params[:id])
    card = CreditCard.where(user_id: current_user.id ).first
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    customer = Payjp::Customer.retrieve(card.customer_id)
    @default_card_information = customer.cards.retrieve(card.card_id)
  end

  def pay
    # @item = Item.find(params[:id])
    card = CreditCard.where(user_id: current_user.id )
    if card.blank?
      redirect_to action: "new"
      flash[:alert] = '購入にはクレジットカード登録が必要です'
    else
      @item = Item.find(params[:id])
      card = current_user.credit_card
      # テーブル紐付けてるのでログインユーザーのクレジットカードを引っ張ってくる
      Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
      Payjp::Charge.create(
      amount: @item.price, 
      customer: card.customer_id, 
      currency: 'jpy',
      )
      # ↑商品の金額をamountへ、cardの顧客idをcustomerへ、currencyをjpyへ入れる
      # @item = Item.new(buyer_id: current_user.id)
      # if @item.save
        redirect_to done_items_path 
      # else
      #   redirect_to controller: "items", action: 'show'
      # end
    end

  end
  def done
  end

    
  def index

  end

  def show
    @item = Item.find(params[:id])
  end

  def create
  end

  def edit
  end

  def destroy
  end

  def update
    @item = Item.find(params[:id])
  @item.update(buyer_id: current_user.id)
  end

  def new
  end
end
