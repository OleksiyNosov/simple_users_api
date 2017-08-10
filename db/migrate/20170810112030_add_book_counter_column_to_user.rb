class AddBookCounterColumnToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :book_counter, :integer
  end
end
