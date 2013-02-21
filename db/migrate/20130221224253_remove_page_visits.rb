class RemovePageVisits < ActiveRecord::Migration
  def up
    drop_table :page_visits
    remove_column :user_sessions, :IP
    remove_column :user_sessions, :startTime
    remove_column :user_sessions, :keySession
    add_column :user_sessions, :pageName, :string
    add_column :user_sessions, :duration, :integer
  end

  def down
  end
end
