class CreateJoinTableUserItem < ActiveRecord::Migration[5.0]
  def change
    create_join_table :Users, :Items do |t|
       t.index [:user_id, :item_id]
       t.index [:item_id, :user_id]
    end
  end
end
