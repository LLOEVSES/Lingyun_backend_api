class Event < ApplicationRecord
    belongs_to :customer
    belongs_to :worker

    enum status: [:searching, :accepted, :processing, :finished]
end
