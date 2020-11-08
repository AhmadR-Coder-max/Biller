class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.total = (params[:price].to_f * params[:quantity].to_f)
    if @item.save
      flash[:notice] = "Item created successfully."
      redirect_to action: :index
    else
      render('new')
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.total = (params[:price].to_f * params[:quantity].to_f)
    if @item.update_attributes(item_params)
      flash[:notice] = "Item updated successfully."
      redirect_to action: :show, id: @item.id
    else
      render('edit')
    end
  end

  def destroy
    item = Item.find(params[:id]).destroy
    redirect_to action: :index
    flash[:notice] = "Item #{item.name} destroyed successfully."
  end

  private

  def item_params
    params.require(:item).permit(:order_id, :name, :description, :price, :size, :total)
  end
end
