# -*- encoding : utf-8 -*-
class Event < ApplicationRecord
    belongs_to :customer
    belongs_to :worker, optional: true



    enum status: [:searching, :accepted, :processing, :finished, :cancelled]
    enum event_type: [:请选择需要维修种类,:排水,:电气,:土建,:油漆,:门窗,:其他]
end
