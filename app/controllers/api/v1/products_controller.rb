module Api
  module V1
    class ProductsController < ApplicationController
      def index
        if params[:order_id].present?
          @products = Order.find(param[:order_id]).products
        else
          @products = Product.in_stock()
        end

        render json: @products
      end

      def show
        @product = Product.find(params[:id])

        render json: @product
      end

      def create

        @order_product = Order.products.build(product_id: order_product_params[:product_id])

        if @order_product.save
          render json: @order, status: :created, location: api_v1_order_url(@order)
        else
          render json: { message: "Unable to add product to order" }, status: :unprocessable_entity
        end
      end

      private

      def order_product_params
        params.require(:product).permit(:product_id)
      end
    end
  end
end
