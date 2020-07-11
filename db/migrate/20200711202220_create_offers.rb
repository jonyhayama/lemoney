class CreateOffers < ActiveRecord::Migration[6.0]
  def change
    create_table :offers do |t|
      t.string :name, null: false
      t.string :url, null: false
      t.string :description, null: false
      t.datetime :starts_at, null: false
      t.datetime :ends_at
      t.boolean :premium, default: false

      t.timestamps
    end
  end
end
