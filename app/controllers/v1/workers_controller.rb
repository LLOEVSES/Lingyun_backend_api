class V1::WorkersController < ApplicationController
    def index
      if worker_signed_in?
        render json: current_worker
      else
        redirect_to '/workers/sign_in', render: 401 
      end
    end

    def show
      worker = Worker.find(params[:id])
      render json: worker
    end

    def destroy

    end
end
