class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :aasm_state
      t.references :player1, index: true
      t.integer :player1_score
      t.references :player2, index: true
      t.integer :player2_score
      t.references :player3, index: true
      t.integer :player3_score
      t.references :player4, index: true
      t.integer :player4_score
      t.references :question_pack, index: true

      t.timestamps
    end
  end
end
