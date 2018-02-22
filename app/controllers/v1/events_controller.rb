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
            if event.status == "searching"
                event.status = "accepted"
                event.accepted_time = event.updated_at
                event.save
                render json: "You have accepted event"
            else
                render json: "Event has aready been accepted"
            end
        else
            render json: "Cannot find this event"
        end
    end

    def processing
        if current_worker.events.exists?(params[:id])
            event =  current_worker.events.find(params[:id])
            if event.status == "accepted"
                event.status = "processing"
                event.save
                render json: "Event is processing"
            else
                render json: "Accept event first!"
            end
        else
            render json: "Cannot find this event"
        end
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
