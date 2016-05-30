class BooksController < ApplicationController
  def index
    @books = Book.all
    respond_with @books
  end
end
