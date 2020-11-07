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
    @customer = Customer.new
    if @customer.save
      redirect_to :index
    else
      render('new')
    end
  end

  def edit
  end

  private

  def customer_params
    params.require(:customer).permit(:name, )
  end
end
