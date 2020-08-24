class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :first_name, null: false, limit: 20
      t.string :last_name, limit: 20
      t.string :email, null: false, limit: 200
      t.string :password_digest, null: false

      t.timestamps
    end
  end
end
