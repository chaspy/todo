class AddExpireDateToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :expire_date, :datetime
  end
end
