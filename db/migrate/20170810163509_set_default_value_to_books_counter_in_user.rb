class SetDefaultValueToBooksCounterInUser < ActiveRecord::Migration[5.1]
  def change
    change_column_default :users, :books_counter, 0
  end
end
