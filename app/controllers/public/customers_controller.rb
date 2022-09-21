class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def withdrawal
    @customer = current_customer
    @customer.update(is_deleted: true)
    redirect_to root_path
  end

  def unsubscribe
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to customers_path
    else
      render :edit
    end
  end
  private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :email, :last_name_kana, :first_name_kana, :post_code, :address, :phone_number)
  end
end
