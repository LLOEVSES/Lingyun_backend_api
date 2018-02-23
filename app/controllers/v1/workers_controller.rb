# -*- encoding : utf-8 -*-

class V1::WorkersController < ApplicationController
    before_action :authenticate_worker!
    #get current worker information
    def index
         render json: current_worker
    end
    #get specific event find by id
    # def show
    #   render json: current_worker.events.find(params[:id])
    # end


    # Change worker information
    def update
      if current_worker.update(worker_params)
        render json: current_worker
      else
        render json: current_worker.errors.messages
      end
    end

    #worker finish event
    def destroy

      if current_worker.events.exists?(params[:id])
        event = current_worker.events.find(params[:id])
        event.status = "finished"
        event.finished_time = event.updated_at
        event.save
        render json: "event finished"
      else
        render json: "Cannot find this event"
      end
    end

    private
      def worker_params
        params.require(:worker).permit(:name ,:phone_number , :area , :company )
      end

end
