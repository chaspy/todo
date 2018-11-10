class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.references :user, foreign_key: true
      t.references :tag, foreign_key: true
      t.string :image_url

      t.timestamps
    end
  end
end
