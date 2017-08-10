class UserDecorator < ApplicationDecorator
  delegate_all

  decorates_association :books, context: { brief: true }

  def as_json *args
    {
      id: id,
      name: name,
      email: email,
      books_counter: books_counter,
      books: books
    }
  end
end
