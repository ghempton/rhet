class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :category
      t.string :name
      t.string :type

      t.timestamps
    end
  end
end
