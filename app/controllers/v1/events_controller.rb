class V1::EventsController < ApplicationController
    before_action :authenticate_worker!#, except: [:index]

    def index
        events = Event.all
        render json: events
        #render json: "Please sign_in"
    end

    def show
      event = Event.find(params[:id])


      if event.customer == current_customer || current_worker
        render json: event
      else
        render json: "You have no authority to see this", status: 401
      end
    end


    def new
      # render new event form
      render json: "Please create your event"
    end

    def create
      @event = Event.new(event_params)
      #@event.customer = Customer.find_by(auth_token)
      #@event.worker = Worker.first    ###first worker is empty worker
      if @event.save
        redirect_to @event
      else
        render json: @event.errors.messages
      end
    end

    def edit
      #render 'edit'
    end

    def update
      @event = Event.find(params[:id])

      if @event.update(event_params)
        redirect_to @event
      else
        render json: @event.errors.messages
      end
    end

    def destroy
      event = Event.find_by(params[:id])
      event.status = 3
    end

    private
      def event_params
        params.require(:event).permit(:message,:location)
      end
end
