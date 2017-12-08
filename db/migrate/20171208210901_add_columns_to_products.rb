class AddColumnsToProducts < ActiveRecord::Migration[5.0]
  def change
    add_attachment :products, :image
    add_column :products, :in_stock, :integer
  end
end
