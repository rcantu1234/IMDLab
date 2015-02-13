class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :movie_title
      t.string :url
      t.string :description

      t.timestamps null: false
    end
  end
end
