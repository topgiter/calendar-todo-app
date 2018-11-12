class AddGcalIdsToTodos < ActiveRecord::Migration
  def change
    add_column :todos, :gcal_id, :string
    add_column :todos, :gcal_i_cal_uid, :string
  end
end
