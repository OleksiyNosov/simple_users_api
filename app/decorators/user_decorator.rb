class UserDecorator < ApplicationDecorator
  delegate_all

  decorates_association :books, context: { brief: true }

  private
  def _only
    %I[id name email books_counter books]
  end
end
