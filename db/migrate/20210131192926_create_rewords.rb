class CreateRewords < ActiveRecord::Migration[5.2]
  def change
    default = {total: 0, success: 0}
    create_table :rewords do |t|
      t.json "2", default: default
      t.json "3", default: default
      t.json "4", default: default
      t.json "5", default: default
      t.json "6", default: default
      t.json "7", default: default
      t.json "8", default: default
      t.json "9", default: default
      t.json "10", default: default
      t.integer :total, default: 0
      t.integer :success, default: 0
      t.integer :score, default: 0
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
