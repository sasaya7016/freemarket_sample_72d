class CreditCardsController < ApplicationController
  require "payjp"

  def new
    card = CreditCard.where(user_id: current_user.id).first
    # #cardにデータが存在すればshowアクション
    redirect_to action: "show" unless card.blank?
  end

  def pay #payjpとCardのデータベース作成を実施します。
    Payjp.api_key = 'sk_test_1e3fb5db965cfd4b05705ae9'
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
      description: '登録テスト', #なくてもOK
      email: current_user.email, #なくてもOK
      card: params['payjp-token'],
      metadata: {user_id: current_user.id}
      ) #念の為metadataにuser_idを入れましたがなくてもOK
      @card = CreditCard.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to action: "show"
      else
        redirect_to action: "pay"
      end
    end
  end

  def delete #PayjpとCardデータベースを削除します
    card = CreditCard.where(user_id: current_user.id).first
    if card.blank?
    else
      Payjp.api_key = 'sk_test_1e3fb5db965cfd4b05705ae9'
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.delete
    end
      redirect_to action: "new"
  end

  def show #Cardのデータpayjpに送り情報を取り出します
    card = CreditCard.where(user_id: current_user.id).first
    if card.blank?
      redirect_to action: "new" 
    else
      Payjp.api_key = 'sk_test_1e3fb5db965cfd4b05705ae9'
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end
end