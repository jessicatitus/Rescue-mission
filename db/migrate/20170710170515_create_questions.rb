class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.string :title, null:false
      t.string :description, null:false
      t.belongs_to :user, null:false

      t.timestamps
    end
  end
end
