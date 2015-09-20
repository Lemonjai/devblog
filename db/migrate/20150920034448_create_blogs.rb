class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :name
      t.text :summary
      t.text :description

      t.timestamps null: false
    end
  end
end
