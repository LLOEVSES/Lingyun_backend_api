# -*- encoding : utf-8 -*-
class AddStatusToEvent < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :status, :integer, :default => "0"
  end
end
