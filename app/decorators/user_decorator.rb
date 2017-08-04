class UserDecorator < ApplicationDecorator
  delegate_all

  def as_json *args
    {
      id:   id,
      name: name
    }
  end
end
