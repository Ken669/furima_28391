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
    # binding.pry
    if @address.valid? && purchase.valid?
      @item.sold_out = true
      # binding.pry
    else
      render :new
    end
  end

  private

  def address_params
    params.require(:address).permit(
      :postal_code, :prefecture_id, :city,
      :town, :building_name, :phone
    ).merge(user_id: current_user.id)
  end
end
