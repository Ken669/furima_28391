class PurchasesController < ApplicationController
  before_action :redirect_to_sign_in, unless: :current_user

  def new
    @item = Item.find(params[:item_id])
    if @item.user_id == current_user.id || @item.sold_out
      redirect_to '/'
    else
      @purchase = Purchase.new
      @address = Address.new
    end
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
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: params[:token],
      currency: 'jpy'
    )
  end

  def redirect_to_sign_in
    redirect_to new_user_session_path
  end
end
