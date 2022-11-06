class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!
  layout "admin_application"


  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
     if @item.save
      flash[:notice] = "商品の登録に成功しました"
      redirect_to admin_item_path(@item)
     else
      flash[:notice] = "商品の登録に失敗しました"
      render :new
     end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      flash[:notice] = "商品の更新に成功しました"
      redirect_to admin_item_path(@item)
    else
      flash[:notice] = "商品の更新に失敗しました"
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_image, :item_name, :item_body, :genre_id, :none_taxed_price, :sale_status)
  end

end
