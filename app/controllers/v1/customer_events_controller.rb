class V1::CustomerEventsController < ApplicationController
    before_action :authenticate_customer!

    def index
        render json: current_customer.events
    end

    def show
        render json: current_customer.events
    end
end
