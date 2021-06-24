class CreateImports < ActiveRecord::Migration[6.1]
  def change
    create_table :imports do |t|
      t.string :status
      t.references :user, foreign_key: true, index: true
      t.text :contacts

      t.timestamps
    end
  end
end
