class ItemsController < ApplicationController
  def pay
    @item = Item.find(params[:id])
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    charge = Payjp::Charge.create(
    amount: 300,#決済金額の事。変数も使えるので後で解説
    card: params['payjp-token'],
    currency: 'jpy'
    )
  end

    def done
    end
  def index
  end

  def show
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
  end
end
