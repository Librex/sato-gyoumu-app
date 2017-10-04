module Admin
  class CustomersController < ApplicationController
    before_action :set_customer, only: [:edit, :update]
    before_action :authenticate_user!
    
    def index
      @customers = Customer.all
    end
  
    def new
      @customer = Customer.new
      @url = admin_customers_path
    end
  
    def create
      @customer = Customer.create(customer_params)
      if @customer.save
        redirect_to admin_customers_path, notice:"顧客情報は無事登録されました。"
      else
        render :new
      end
    end
    
    def edit
      @url = admin_customer_path(@customer)
    end
  
    def update
      if @customer.update(customer_params)
        redirect_to @customer, notice: "変更が保存されました。"
      else
        render :edit
      end
    end
  
  private
    def set_customer
      @customer = Customer.find(params[:id])
    end
    
    def customer_params
      params.require(:customer).permit(:code, :ryaku, :name, :telnum, :faxnum)
    end
  
  end
end