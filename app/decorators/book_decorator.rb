class BookDecorator < ApplicationDecorator
  delegate_all

  def as_json *args
    {
      user_name: user.name,
      user_id:   user.id,
      title:     title,
      author:    author,
      year:      year 
    }
  end
end
