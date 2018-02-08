class V1::CustomersController < ApplicationController
    before_action :authenticate_customer!

    def index
      render json: current_customer
    end

    def update
      if current_customer.update(customer_params)
        render json: current_customer
      else
        render json: current_customer.errors.messages
      end
    end

    private
      def customer_params
        params.require(:customer).permit(:name)
      end
end
