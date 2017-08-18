class BookDecorator < ApplicationDecorator
  delegate_all

  private
  def _only
    only = %I[title author year]
  end

  def _methods
    [] unless context[:brief]
      
    %I[user_id user_name]
  end
end
