class CreateShares < ActiveRecord::Migration[6.1]
  def change
    create_table :shares do |t|

      t.timestamps
    end
  end
end
