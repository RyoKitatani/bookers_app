class BooksController < ApplicationController
  def index
    @books = Book.all.order(created_at: :desc)
  end

  def new
    @book = Book.ne
  end

  def create 
    book = Book.new(book_params)
    if book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(book.id)
    else
      render 'index'
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def destroy
    book = Book.find(params[:id])
    if book.destroy
     flash[:notice] = "Book was successfully destroyed."
     redirect_to books_path
    end
  end
  
  def update
    book =Book.find(params[:id] )
    if book.update(book_params)
      flash[:notice] = "Book was successfully updated."
      redirect_to book_path(book.id)
    end
  end
  
  private
  def book_params
    params.permit(:title, :body)
  end
end
