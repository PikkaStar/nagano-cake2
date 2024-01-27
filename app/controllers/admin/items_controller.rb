class Admin::ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] ="商品を登録しました"
      redirect_to admin_item_path(@item)
    else
      flash.now[:alert] = "登録に失敗しました"
      render :new
    end
  end

  def index
    @items = Item.all
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
      flash[:notice] = "更新に成功しました"
    else
      flash[:alert] = "更新に失敗しました"
      render :edit
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    flash[:notice] = "商品を削除しました"
    redirect_to admin_items_path
  end

end
