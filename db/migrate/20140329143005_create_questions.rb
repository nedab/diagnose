class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.decimal :number
      t.string :content
      t.string :answer1
      t.string :answer2
      t.string :answer3
      t.string :answer4
      t.integer :right

      t.timestamps
    end
  end
end
