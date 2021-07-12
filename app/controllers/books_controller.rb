class BooksController < ApplicationController
  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  # def new
  #   @book = Book.new
  # end

  def create
    @books = Book.all
    @book = Book.new
    book = Book.new(book_params)
    if book.save
      flash[:success] = "Book was successfully created."
      redirect_to book_path(book.id)
    else
      flash.now[:danger] = "errors"
      render :index
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    book = Book.find(params[:id])
    if book.update(book_params)
      flash[:success] = "Book was successfully created."
      redirect_to book_path(book.id)
    else
      flash.now[:danger] = "errors"
      render :show
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
