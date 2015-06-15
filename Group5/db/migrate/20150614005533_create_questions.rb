class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.string :questionType
      t.boolean :enable
      t.integer :topic_id

      t.timestamps null: false
    end
  end
end
