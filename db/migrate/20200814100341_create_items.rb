class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references  :user,                   foreign_key: true
      t.string      :image,                  null: false, default: ""
      t.string      :name,                   null: false, default: ""
      t.string      :explanation,            null: false, default: ""
      t.integer     :category_id,            null: false
      t.integer     :status_id,              null: false
      t.integer     :who_cover_fee_id,       null: false
      t.integer     :where_delivery_from_id, null: false
      t.integer     :how_long_id,            null: false
      t.integer     :price,                  null: false
      t.timestamps
    end
  end
end
