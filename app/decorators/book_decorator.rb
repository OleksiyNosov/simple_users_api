class BookDecorator < ApplicationDecorator
  delegate_all

  def as_json *args
    {
      title: title,
      author: author,
      year: year
    }.tap do |hash| 
      unless context[:brief]
        hash[:user_id] = user.id
        hash[:user_name] = user.name
      end
    end
  end
end
