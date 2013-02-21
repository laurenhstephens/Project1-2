class CreateUserSessions < ActiveRecord::Migration
  def change
    create_table :user_sessions do |t|
      t.timestamp :endGuess
      t.integer :duration
      t.string :pageName

      t.timestamps
    end
  end
end
