# -*- encoding : utf-8 -*-

class V1::CustomerEventsController < ApplicationController
    before_action :authenticate_customer!
    #get customer_events
    def index
        render json: current_customer.events
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
        if event.save
          render json: event
        else
          render json: event.errors.messages
        end

    end

    #edit event infromation
    def update
        event = current_customer.events.find(params[:id])
        if event.update(event_params)
            render json: event
        else
            render json: event.errors.messages
        end
    end

    #custoemr cancel event
    def destroy
        event = current_customer.events.find(params[:id])
        if event
            if event.status == "searching"
                event.status = "cancelled"
                if event.save
                    render json: event
                else
                    render json: event.errors.messages
                end
            elsif event.status == "cancelled"
                render json: "Event has already cancelled"
            else
                render json: "Event is processing or finishied, please contact your worker"
            end
        else
            render json: "Event does not exist"
        end
    end

    private
      def event_params
        params.require(:event).permit(:detail, :event_type, :area, :address, :free_time)
      end
end
