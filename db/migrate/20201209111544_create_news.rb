class CreateNews < ActiveRecord::Migration[6.0]
  def change
    create_table :news do |t|
      t.text :title
      t.datetime :published_at

      t.timestamps
    end
  end
end
