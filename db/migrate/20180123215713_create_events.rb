class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
       t.string :message
       t.string :location
       t.integer :customer_id
       t.integer :worker_id

       t.timestamps
     end
     add_index("events",['customer_id', 'worker_id'])
  end
end
