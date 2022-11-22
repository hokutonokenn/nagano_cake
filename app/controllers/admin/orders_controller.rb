class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  layout "admin_application"


  def index
    @customer = Customer.find(params[:id])
    @orders   = @customer.orders.page(params[:page]).order(created_at: :desc)
  end

  def show
    @order       = Order.find(params[:id])
    @order_items = @order.order_items
  end

  def update
    @order       = Order.find(params[:id])
    @order_items = @order.order_items
    @order.update(order_params)
    if  @order.order_status == "payment_comfirmation"
      @order.order_items.update_all(manufacture_status: "waiting_for_manufacture")
    end
  end

  private

  def order_params
    params.require(:order).permit(:order_status)
  end

end
