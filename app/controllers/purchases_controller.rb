class PurchasesController < ApplicationController
  def new
    @item = Item.find(params[:item_id])
    @address = Address.new
  end

  def create
  end
end
