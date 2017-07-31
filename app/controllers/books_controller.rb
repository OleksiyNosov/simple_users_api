class BooksController < ApplicationController

private
  def resource
    @book ||= collection.find params[:id] 
  end

  def build_resource
    @book = Book.new resource_params
  end

  def resource_params
    params.permit(:title, :author, :year, :user_id)
  end

  def collection
    @books ||= User.find(params[:user_id]).books
  end
end