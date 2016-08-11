class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :username
      t.string :mail
      t.longtext :content
      t.integer :commentable_id
      t.string :commentable_type
      t.integer :reply, default: 0
      t.string :ip
      t.timestamps
    end
  end
end
