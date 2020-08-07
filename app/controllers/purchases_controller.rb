class PurchasesController < ApplicationController
  def new
    @item = Item.find(params[:item_id])
    @purchase = Purchase.new
  end

  def create
  end
end
