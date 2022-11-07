class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.text :body
      t.string :status
      t.integer :owner_id

      t.timestamps
    end
  end
end
