class AddBodyToCustomers < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :body, :string
  end
end
