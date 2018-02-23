# -*- encoding : utf-8 -*-
class Event < ApplicationRecord
    belongs_to :customer
    belongs_to :worker

    validates :address
    validates :detail

    enum status: [:searching, :accepted, :processing, :finished, :cancelled]
    enum event_type: [:water, :earth, :fire, :wind]
end
