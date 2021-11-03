class CreateVisits < ActiveRecord::Migration[6.1]
  def change
    create_table :visits do |t|
      t.string "full_url", null: false
      t.string "host", null: false
      t.string "pathname", null: false
      t.string "referring_host"
      t.belongs_to :website, null: false
      t.timestamps
    end
  end
end
