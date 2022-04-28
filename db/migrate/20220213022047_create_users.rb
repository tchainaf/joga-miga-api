class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :uuid, null: false
      t.string :name, null: false
      t.string :email
      t.string :phone
      t.string :encrypted_password
      t.integer :status, null: false, default: 0
      t.integer :role, null: false, default: 0
      t.timestamps

      t.index :uuid, unique: true
    end
  end
end
