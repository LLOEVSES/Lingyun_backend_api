class V1::CustomerEventsController < ApplicationController
    before_action :authenticate_customer!

    def index
        render json: current_customer.events
    end

    def show
        render json: current_customer.events
    end

    def create
        event = Event.new(event_params)
        event.customer_id = current_customer.id
        #the first worker is empty worker means: searching worker
        event.worker_id = 1
        if event.save
          render json: event
        else
          render json: event.errors.message
        end
    end

    def destroy

    end

    private
      def  event_params
        params.require(:event).permit(:message, :location)
      end
end
