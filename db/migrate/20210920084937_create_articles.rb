class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|

      t.integer    :category_id,           null: false
      t.integer    :status_id,             null: false
      t.integer    :delivery_fee_id,       null: false
      t.integer    :area_id,               null: false
      t.integer    :arrival_date_id,       null: false

      t.timestamps
    end
  end
end
