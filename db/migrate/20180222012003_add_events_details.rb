class AddEventsDetails < ActiveRecord::Migration[5.1]
  def change
    rename_column :events, :message, :detail
    add_column :events, :type, :integer, :default => "0"
    add_column :events, :area, :string
    add_column :events, :address, :string
    add_column :events, :accept_time, :string
    add_column :events, :finished_time, :string
  end
end
