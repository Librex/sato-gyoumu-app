class CreateCustomers < ActiveRecord::Migration[5.0]
  def change
    create_table :customers do |t|
      t.string :code
      t.string :ryaku
      t.string :name
      t.string :telnum
      t.string :faxnum

      t.timestamps
    end
  end
end
