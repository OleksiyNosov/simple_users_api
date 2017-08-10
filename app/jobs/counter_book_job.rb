class CounterBookJob < ApplicationJob
  queue_as :default

  def perform user_id
    user = User.find user_id

    user.increment! :book_counter
  end 
end