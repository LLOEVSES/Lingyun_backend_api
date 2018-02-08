class V1::WorkersController < ApplicationController
    before_action :authenticate_worker!
    def index
         render json: current_worker
    end

    def show
      render json: current_worker.events
    end

    def update
      if current_worker.update(worker_params)
        render json: current_worker
      else
        render json: current_worker.errors.messages
      end
    end

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
      def worker_params
        params.require(:worker).permit(:name)
      end
end
