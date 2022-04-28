class CreateClasses < ActiveRecord::Migration[5.2]
  def change
    create_table :classes do |t|
      t.string :name
      t.string :week_day
      t.time   :start_time
      t.string :address
      t.float  :monthly_fee
      t.float  :daily_fee
      t.integer :status, null: false, default: 0
      t.timestamp :canceled_at
    end
  end
end
