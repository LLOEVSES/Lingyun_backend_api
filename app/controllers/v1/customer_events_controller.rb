class V1::CustomerEventsController < ApplicationController
    before_action :authenticate_customer!
    #get customer information
    def index
        render json: current_customer
    end
    #get customer event find by specific id
    def show
        render json: current_customer.events.find(params[:id])
    end

    #customer create new event
    def create
        event = Event.new(event_params)
        event.customer_id = current_customer.id
        #the first worker is empty worker means: searching worker
        event.worker_id = 2
        if event.save
          render json: event
        else
          render json: event.errors.message
        end
    end

    #custoemr cancel event
    def destroy
        # if current_customer.events.exists?(params[:id])
        #     event = current_customer.events.find(params[:id])
        #     if event.status == "searching"
        #         event.status = "cancelled"
        #         if event.save
        #             render :json event
        #         else
        #             render :json event.errors.messages
        #     end
        # else
        #     render json: "Event does not exist"
        # end
    end

    private
      def  event_params
        params.require(:event).permit(:message, :location)
      end
end
