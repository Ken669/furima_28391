class PurchasesController < ApplicationController
  def new
    @item = Item.find(params[:item_id])
    @purchase = Purchase.new
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    purchase = Purchase.new(item_id: params[:item_id], user_id: current_user.id)
    @item = purchase.item
    if @address.valid? && purchase.valid?
      buy_item
      @address.save
      purchase.save
      @item.sold_out = true
      @item.save
    else
      render :new
    end
  end

  private

  def address_params
    params.require(:address).permit(
      :postal_code, :prefecture_id, :city,
      :town, :building_name, :phone,
      :token
    ).merge(user_id: current_user.id)
  end

  def buy_item
    Payjp.api_key = 'sk_test_9e00c98c40b3f79f09364de1'
    # Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: params[:token],
      currency: 'jpy'
    )
  end
end
