class DestroyMealContents < ActiveRecord::Migration[6.0]
  def up
    drop_table :meal_contents
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
