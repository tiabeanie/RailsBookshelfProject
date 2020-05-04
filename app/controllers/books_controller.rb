class BooksController < ApplicationController
    before_action :require_login
    before_action :set_show, only: [:show, :edit, :update]
    before_action :created_by_current_user, only: [:edit, :update]
    helper_method :current_user 

    def index 
        @user = User.find_by(id: params[:user_id])
        if @user 
            @books = @user.books.uniq
        else
            @books = Book.all 
        end
    end

    def show
        @entries = @book.books_bookshelves_by_user(current_user.id)
    end

    def new 
        @book = Book.new
        @entries = @book.entries.build
    end

    def create 
        @book = Book.new(book_params)
        if @book.save
            flash[:message] = "#{@book.title} has been created"
            redirect_to book_path(@book)
        else
            render :new
        end
    end

    def edit
    end

    def update 
        @book.update(book_params)
        if @book.save 
            flash[:message] = "#{book.title} has been updated"
            redirect_to book_path(@book)
        else
            render :edit
        end
    end

    def search
        @books = Book.search(params[:query])
        render :index
    end

    private 
    def book_params
        params.require(:book).permit(:title, :description, :author_id, :current_chapter, :created_by, genre_ids:[], genres_attribures:[:name], author_attributes:[:name])
    end

    def set_book
        @book = Book.find_by(id: params[:id])
    end

    def created_by_current_user
        unless @book.created_by == current_user.id
            flash[:danger] = "You cannot edit a book you didn't create"
            redirect_to book_path(@book)
        end
    end
end
