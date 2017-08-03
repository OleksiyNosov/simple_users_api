class BooksController < ApplicationController

private
  def resource
    @book ||= collection.find params[:id] 
  end

  def build_resource
    @book = parent.books.build resource_params
  end

  def resource_params
    params.require(:book).permit(:title, :author, :year)
  end

  def collection
    @books ||= parent.books
  end

  def parent
    User.find params[:user_id]
  end
end