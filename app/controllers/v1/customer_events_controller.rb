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
        event.worker_id = 2
        if event.save
          render json: event
        else
          render json: event.errors.messages
        end
        # render json: "200"
    end

    #edit event infromation
    def update
        event = current_customer.events.find(params[:id])
        if event.update(:detail => request.headers['detail'],:event_type => request.headers['event_type'],
                        :area => request.headers['area'], :address => request.headers['address'],
                        :free_time => request.headers['free_time'])
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
