class CounterBookJob < ApplicationJob
  queue_as :default

  def refresh user_id
    user = User.find user_id

    user.update book_counter: (user.book_counter + 1)
  end 
end