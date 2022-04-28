class CreatePresences < ActiveRecord::Migration[5.2]
  def change
    create_table :presences do |t|
      t.belongs_to :user, foreign_key: true, null: false
      t.belongs_to :classes, foreign_key: true, null: false
      t.timestamp  :date, null: false
      t.integer    :payment_type, null: false
    end
  end
end
