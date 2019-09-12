class CreateEquations < ActiveRecord::Migration[5.2]
  def change
    create_table :equations do |t|
      t.string :title
      t.string :form

      t.timestamps
    end
  end
end
