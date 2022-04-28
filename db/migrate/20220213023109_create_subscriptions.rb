class CreateSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :subscriptions do |t|
      t.belongs_to :user, foreign_key: true, null: false
      t.belongs_to :classes, foreign_key: true, null: false
      t.date       :expires_at
      t.float      :price
      t.date       :start_date, null: false
      t.integer    :status, null: false, default: 0
      t.integer    :available_make_ups, default: 0
      t.timestamps
    end
  end
end
