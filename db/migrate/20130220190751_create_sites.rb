class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string :key
      t.string :url
      t.string :name
      t.string :desc

      t.timestamps
    end
  end
end
