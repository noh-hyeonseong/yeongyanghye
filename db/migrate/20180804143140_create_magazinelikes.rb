class CreateMagazinelikes < ActiveRecord::Migration[5.0]
  def change
    create_table :magazinelikes do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :magazine, foreign_key: true

      t.timestamps
    end
  end
end
