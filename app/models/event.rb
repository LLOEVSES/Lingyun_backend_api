class Event < ApplicationRecord
    belongs_to :customer
    belongs_to :worker

    validates :address, presence: true
    validates :detail, presence: true

    enum status: [:searching, :accepted, :processing, :finished, :cancelled]
    enum event_type: [:water, :earth, :fire, :wind]
end
