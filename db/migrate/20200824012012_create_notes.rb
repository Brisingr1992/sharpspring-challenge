class CreateNotes < ActiveRecord::Migration[6.0]
  def change
    create_table :notes do |t|
      t.string :title, limit: 30
      t.string :body, limit: 1000
      t.references :user, null: false, foreign_key: true
      t.datetime :published_at

      t.timestamps
    end
  end
end
