class AddDetails < ActiveRecord::Migration[5.1]
  def change
    #Add phone number
    add_column :customers, :phone_number, :string
    add_column :workers, :phone_number, :string

    #Add abstract location
    add_column :customers, :area, :string
    add_column :workers, :area, :string
    add_column :workers, :company, :string
    add_column :customers, :location, :string

  end
end
