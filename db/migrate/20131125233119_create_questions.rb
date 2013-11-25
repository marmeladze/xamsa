class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :text
      t.references :question_pack, index: true
      t.integer :order

      t.timestamps
    end
  end
end
