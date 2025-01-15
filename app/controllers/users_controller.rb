class UsersController < ApplicationController
  def new
  end
  
  def create
    @book = Book.new(book_params)
    @user = current_user
    @book.save
    redirect_to books_path
  end

  def index
    @users = User.all
  end

  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books
  end
  
  def edit
  end


end
