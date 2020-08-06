class ItemsController < ApplicationController
  before_action :redirect_to_sign_in, unless: :current_user, except: [:index]

  def index
    @items = Item.includes(:user)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def redirect_to_sign_in
    redirect_to new_user_session_path
  end

  def item_params
    params.require(:item).permit(
      :name,
      :detail,
      :category_id,
      :condition_id,
      :shipping_fee_id,
      :prefecture_id,
      :shipping_schedule_id,
      :price,
      :image
    ).merge(user_id: current_user.id, sold_out: false)
  end
end
