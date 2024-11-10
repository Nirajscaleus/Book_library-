class BooksController < ApplicationController
  # before_action :only_allow_owner, only: [:new, :create, :edit, :update, :destroy]

  def index
    @q = Book.ransack(params[:q])
    if session[:user_id]
     @user = User.find_by(id: session[:user_id])
      if @user.role == 'owner'
        @books = @user.books
      else
        @books = Book.all
        @books = @q.result(distinct: true)
      end
    end  

  end 
  
  def show
    @book = Book.find(params[:id])
  end

  def new
   @book = Book.new
  end

  def create
   @book = Book.new(books_params)
   if @book.save
    redirect_to @book
   else
    render :new
   end
  end

  def edit
   @book = Book.find(params[:id])
  end

  def update
   @book = Book.find(params[:id])
   if @book.update(books_params)
     redirect_to @book
   else
    render :edit
   end
  end

  def destroy
   @book = Book.find(params[:id])
   @book.destroy

   redirect_to root_path
  end

  private
  def books_params
    params.require(:book).permit(:title, :author, :price, :description, :user_id)
  end
  # private
  #      def only_allow_owner
  #           unless User.find_by(id: session[:user_id])&.role == 'owner'
  #           flash[:alert] = "You are not authorized to perform this action."
  #           redirect_to books_path
  #           end
  #       end
end
