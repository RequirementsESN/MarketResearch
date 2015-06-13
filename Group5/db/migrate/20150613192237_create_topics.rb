class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :title
      t.string :description
      t.boolean :enable

      t.timestamps null: false
    end
  end
end
