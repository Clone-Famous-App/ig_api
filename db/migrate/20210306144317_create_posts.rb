class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :captions
      t.string :photo_url

      t.timestamps
    end
  end
end
