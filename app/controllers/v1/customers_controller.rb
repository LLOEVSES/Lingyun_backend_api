class V1::CustomersController < ApplicationController
    before_action :authenticate_customer!
    #Show current customer
    def index
      render json: current_customer
    end

    #Update current customer's information
    def update
      if current_customer.update(:name => request.headers[:name],:phone_number => request.headers[:phone_number], :area => request.headers[:area], :location => request.headers[:location])
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
