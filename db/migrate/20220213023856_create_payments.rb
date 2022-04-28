class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.belongs_to :user, foreign_key: true, null: false
      t.belongs_to :classes
      t.belongs_to :subscription
      t.timestamp  :date, null: false
      t.float      :amount, null: false
    end
  end
end
