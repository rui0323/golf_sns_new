class CreateReposts < ActiveRecord::Migration[6.1]
  def change
    create_table :reposts do |t|

      t.timestamps
    end
  end
end
