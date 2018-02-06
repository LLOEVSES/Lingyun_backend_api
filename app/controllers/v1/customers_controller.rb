class V1::CustomersController < ApplicationController
    before_action :authenticate_customer!

    def index
      render json: current_customer
    end
end
