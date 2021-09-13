class BooksController < ApplicationController
 
  def index
    @current_user = User.find(session[:user_id])    
    @books = Book.all    
  end   

  
 
  def show   
    @current_user = User.find(session[:user_id]) 
    @book = Book.find(params[:id])  
    @issued_books = IssuedBook.find_by(book_id: @book.id)  
  end   
  
   
  def new   
    @book = Book.new 
  end   
  
  
  def create   
    @book = Book.new(book_params)   
    if @book.save   
      flash[:notice] = 'Book added!'   
      redirect_to books_path   
    else   
      flash[:error] = 'Failed to edit book!'   
      render :new   
    end   
  end 

  def borrow
    @book = Book.find(params[:id])
    @book.is_borrowed = true
    @book.user_id = session[:user_id]
    @issued_book = IssuedBook.find_by(book_id: @book.id)

    if @book.save! 
      @issued_book.update_columns(issue_date: DateTime.now)
      redirect_to @book, notice: 'Book is successfully borrowed.'
    else 
      flash[:notice] = 'Book is already borrowed.'
      render :show
    end
  end

  
  def return
    @book=Book.find(params[:id])  
    @book.return = true
    @current_user = User.find(session[:user_id]) 
    @issued_book = IssuedBook.find_by(book_id: @book.id)    

    if @book.is_borrowed && (@book.user_id != Current.user.id) 
      invalid_return = true
    end   
 
    @book.is_borrowed=false
    @book.user_id = nil
    if !invalid_return && @book.save!
      @issued_book.update_columns(return_date: DateTime.now)
      flash[:notice] = 'Book returened successfully.'      
      redirect_to @book

    else              
      redirect_to books_path   
    end
  end 
  
  
    
  def edit   
    @book = Book.find(params[:id])   
  end   
  
   
  def update   
    @book = Book.find(params[:id])  
    if @book.update_attributes(book_params)   
      flash[:notice] = 'Book updated!'   
      redirect_to books_path   
    else   
      flash[:error] = 'Failed to edit book!'   
      render :edit   
    end   
 end   
  
   
  def destroy   
    @book = Book.find(params[:id])   
    if @book.delete   
      flash[:notice] = 'Book deleted!'   
      redirect_to books_path   
    else   
      flash[:error] = 'Failed to delete this book!'   
      render :destroy   
    end   
 end 
 
 
  
  def book_params   
    params.require(:book).permit(:book_name, :desc, :is_borrowed, :issue_date, :return_date)    
  end  

end
