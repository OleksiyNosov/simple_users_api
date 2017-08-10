class ChangeUserColumnNameFromBookCounterToBooksCounter < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :book_counter, :books_counter
  end
end
