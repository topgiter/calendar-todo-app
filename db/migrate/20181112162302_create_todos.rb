class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :title
      t.text :description
      t.string :status

      t.timestamps
    end
  end
end
