class CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      flash[:notice] = "Customer was created successfully."
      redirect_to action: :index
    else
      render('new')
    end
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update_attributes(customer_params)
      flash[:notice] = "Customer updated successfully."
      redirect_to action: :show, id: @customer.id
    else
      render('edit')
    end
  end

  def destroy
    customer = Customer.find(params[:id]).destroy
    redirect_to action: :index
    flash[:notice] = "Customer #{customer.name} destroyed successfully."
  end

  private

  def customer_params
    params.require(:customer).permit(:user_id, :name, :address_1, :address_2, :phone_1, :phone_2)
  end
end
