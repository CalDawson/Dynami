class ChangeTimeToDate < ActiveRecord::Migration[6.0]
  def change
    change_column :workout_sessions, :time, :date
  end
end
