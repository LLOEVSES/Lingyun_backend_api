class V1::EventsController < ApplicationController
    #event action for workers
    before_action :authenticate_worker!#, except: [:index]

    #Get events,
    def index
        if params[:status] == "searching"
            events = Event.where(status: "searching")
        elsif params[:status] == "finished"
            events = current_worker.events.where(status: "finished")
        end
        render json: events
    end

    def show
      event = Event.find(params[:id])


      if event.worker == current_worker || event.status == "searching"
        render json: event
      else
        render json: "You have no authority to see this", status: 401
      end
    end

    def accepted
        if current_worker.events.exists?(params[:id])
            event =  current_worker.events.find(params[:id])
        else
            render json: "Cannot find this event"
        end
        event.status = "accepted"
        render json: "You have accepted event"
    end

    def processing
        if current_worker.events.exists?(params[:id])
            event =  current_worker.events.find(params[:id])
        else
            render json: "Cannot find this event"
        end
        event.status = "processing"
        render json: "Event processing"
    end

    # def new
    #   # render new event form
    #   render json: "Please create your event"
    # end

    def create
      render json: "Worker cannot create event, please switch to customer accout"
    end

    # def edit
    #
    # end

    # def update
    #   @event = Event.find(params[:id])
    #   @event.worker_id = current_worker.id
    #   if @event.update(event_params)
    #     redirect_to @event
    #   else
    #     render json: @event.errors.messages
    #   end
    # end

    #worker finish event
    def destroy

      if current_worker.events.exists?(params[:id])
        event = current_worker.events.find(params[:id])
        event.status = "finished"
        event.save
        render json: "event finished"
      else
        render json: "Cannot find this event"
      end
    end

    private
      def event_params
        params.require(:event).permit(:message,:location)
      end
end
