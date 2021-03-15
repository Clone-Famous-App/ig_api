class RemoveMandatoryUserFromPost < ActiveRecord::Migration[6.1]
  def change
    remove_reference :posts, :users, null: true, foreign_key: true
    add_reference :posts, :user,  optional: true
  end
end
