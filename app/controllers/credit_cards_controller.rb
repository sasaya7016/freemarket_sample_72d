class CreditCardsController < ApplicationController

  require 'payjp'

  def index
  end

  def show
    credit_card = CreditCard.where(user_id: current_user.id).first
    if credit_card.blank?
      redirect_to action: "new" 
    else
      Payjp.api_key = ENV["sk_test_1e3fb5db965cfd4b05705ae9"]
      customer = Payjp::Customer.retrieve(credit_card.customer_id)
      @default_card_information = customer.credit_cards.retrieve(credit_card.card_id)
    end
  end
  end

  def create
  end

  def edit
  end

  def destroy
  end

  def update
  end

  def new
    credit_card = CreditCard.where(user_id: current_user.id)
    redirect_to credit_card_path(current_user.id).empty?
  end

  def pay #payjpとCardのデータベース作成を実施します。
    Payjp.api_key = ENV["sk_test_1e3fb5db965cfd4b05705ae9"]
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
      credit_card: params['payjp-token'],
      metadata: {user_id: current_user.id}
      ) #念の為metadataにuser_idを入れましたがなくてもOK
      @credit_card = CreditCard.new(user_id: current_user.id, customer_id: customer.id, credit_card_id: customer.default_card)
      if @credit_card.save
        redirect_to action: "show"
      else
        redirect_to action: "pay"
      end
    end
  end

  def delete #PayjpとCardデータベースを削除します
    credit_card = CreditCard.where(user_id: current_user.id).first
    if credit_card.blank?
    else
      Payjp.api_key = ENV["sk_test_1e3fb5db965cfd4b05705ae9"]
      customer = Payjp::Customer.retrieve(credit_card.customer_id)
      customer.delete
      credit_card.delete
    end
      redirect_to action: "new"
  end


