class V1::AdminsController < ApplicationController
  #before_action :authenticate_admin!

  def workers
    workers = Worker.all
    render json: workers
  end

  def customers
    customers = Customer.all
    render json: customers
  end

  def events
    events = Event.all
    render json: events
  end
end
