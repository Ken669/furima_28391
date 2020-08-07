class ItemsController < ApplicationController
  before_action :redirect_to_sign_in, unless: :current_user, except: [:index, :show]
  before_action :item_find, only: [:show, :destroy, :edit, :update]

  def index
    @items = Item.includes(:user)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to @item
    else
      render :new
    end
  end

  def show
    @text = @item.detail.split(/\r\n|\r|\n/)
  end

  def destroy
    if @item.destroy
      redirect_to @item
    else
      render :show
    end
  end

  def edit
    unless @item.user_id == current_user.id
      render :show
    end
  end

  def update
    if @item.update(item_params)
      redirect_to @item
    else
      render :edit
    end
  end

  private

  def item_find
    @item = Item.find(params[:id])
  end

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
