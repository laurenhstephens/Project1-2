class AddSiteId < ActiveRecord::Migration
  def up
    add_column :user_sessions, :site_id, :integer
  end

  def down
    remove_column :user_sessions, :site_id
  end
end
