class AddAllowPasswordChangeToCustomers < ActiveRecord::Migration[5.1]
  def change
    add_column :customers, :allow_password_change, :boolean, default: false, null: false
  end
end
