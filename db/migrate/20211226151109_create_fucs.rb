class CreateFucs < ActiveRecord::Migration[7.0]
  def change
    create_table :fucs do |t|
      t.integer :param
      t.integer :index
      t.string :factorial
      t.string :first
      t.string :second
      t.string :third
      t.string :find

      t.timestamps
    end
  end
end
