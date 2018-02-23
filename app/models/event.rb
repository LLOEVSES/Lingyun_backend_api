# -*- encoding : utf-8 -*-
class Event < ApplicationRecord
    belongs_to :customer
    belongs_to :worker



    enum status: [:searching, :accepted, :processing, :finished, :cancelled]
    enum event_type: [:water, :earth, :fire, :wind]
end
