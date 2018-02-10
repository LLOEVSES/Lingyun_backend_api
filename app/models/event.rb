class Event < ApplicationRecord
    belongs_to :customer
    belongs_to :worker

    validates :location, presence: true
    validates :message, presence: true

    enum status: [:searching, :accepted, :processing, :finished]
end
