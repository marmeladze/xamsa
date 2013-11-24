class CreateQuestionPacks < ActiveRecord::Migration
  def change
    create_table :question_packs do |t|
      t.string :title

      t.timestamps
    end
  end
end
