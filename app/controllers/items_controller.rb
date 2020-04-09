class ItemsController < ApplicationController
  before_action :authenticate_user!
  
  require "payjp"

  def buy #クレジット購入
    card = CreditCard.where(user_id: current_user.id).first
      @item = Item.find(params[:id])
      @image = ItemImage.where(item_id: @item.id).first
      if card.present?
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
      end
  end

  def pay
      @item = Item.find(params[:id])
      card = CreditCard.where(user_id: current_user.id).first
      if card.blank?
        redirect_to new_credit_card_path 
      else
      Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
      Payjp::Charge.create(
      amount: @item.price, 
      customer: card.customer_id, 
      currency: 'jpy',
      )
      end
        redirect_to done_item_path(@item.id) 
  end

  def done
    @item = Item.find(params[:id])
    @item.update(buyer_id: current_user.id)
  end

  def show
  end

  def create
  end

  def edit
  end

  def destroy
  end

  def new
  end
end


