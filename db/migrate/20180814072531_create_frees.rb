class CreateFrees < ActiveRecord::Migration[5.0]
  def change
    create_table :frees do |t|
      t.string :title
      t.text :content
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
