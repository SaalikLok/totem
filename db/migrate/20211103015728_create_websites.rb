class CreateWebsites < ActiveRecord::Migration[6.1]
  def change
    create_table :websites do |t|
      t.string :title, null: false
      t.string :url, null: false
      t.timestamps
    end
  end
end
