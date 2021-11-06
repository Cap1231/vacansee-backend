class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.text :text
      t.string :name

      t.timestamps
    end
  end
end
