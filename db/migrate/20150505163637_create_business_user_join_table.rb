class CreateBusinessUserJoinTable < ActiveRecord::Migration
  def change
    create_join_table :businesses, :users do |t|
      # t.index [:business_id, :user_id]
      # t.index [:user_id, :business_id]
    end
  end
end
