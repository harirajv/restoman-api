class OrderItemsController < ApplicationController
  before_action :set_order_item, only: [:show, :update, :destroy]

  # GET /orders/:order_id/order_items
  def index
    @order_items = OrderItem.all

    render json: @order_items
  end

  # GET /orders/:order_id/order_items/1
  def show
    render json: @order_item
  end

  # POST /orders/:order_id/order_items
  def create
    @order_item = OrderItem.new(order_item_params)

    if @order_item.save
      render json: @order_item, status: :created, location: @order_item
    else
      render json: @order_item.errors, status: :unprocessable_entity
    end
  end

  # PUT /orders/:order_id/order_items/1
  def update
    if @order_item.update(order_item_params)
      render json: @order_item
    else
      render json: @order_item.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_item
      @order_item = OrderItem.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def order_item_params
      params.fetch(:order_item, {})
    end
end