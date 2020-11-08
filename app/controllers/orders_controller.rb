class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
  end

  def create
    puts "======order_params == #{order_params}"
    @order = Order.new(order_params)
    if @order.save
      flash[:notice] = "Order created successfully."
      redirect_to action: :index
    else
      render('new')
    end
  end

  def edit
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    if @order.update_attributes(order_params)
      flash[:notice] = "Order updated successfully."
      redirect_to action: :show, id: @order.id
    else
      render('edit')
    end
  end

  def destroy
    order = Order.find(params[:id]).destroy
    redirect_to action: :index
    flash[:notice] = "Order destroyed successfully."
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :total_bill, :item_names)
  end
end
