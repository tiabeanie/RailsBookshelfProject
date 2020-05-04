class BookshelvesController < ApplicationController
    before_action :require_login
    before_action :set_user_bookshelf, only: [:show, :edit, :update, :destroy]
    before_action :set_user 

    def index 
        @bookshelves = current_user.bookshelves
    end

    def new 
        @bookshelf = Bookshelf.new
    end

    def create
        @bookshelf = @user.bookshelves.build(bookshelf_params)
        if @bookshelf.save
            redirect_to bookshelf_path(@bookshelf)
            flash[:message] = "New Bookshelf Created"
        else 
            render :new
        end
    end

    def show 
        @books = @bookshelf.books
    end

    def edit
    end

    def update
        @bookshelf.update(bookshelf_params)
        if @bookshelf.save 
            redirect_to bookshelf_path(@bookshelf)
            flash[:message] = "#{@bookshelf.name} has been updated"
        else
            render :edit
        end
    end

    def destroy 
        if @bookshelf 
            @bookshelf.destroy
            redirect_to bookshelves_path
            flash[:message] = "Your bookshelf has been deleted"
        else
            render :show
            flash[:danger] = "Your bookshelf could not be deleted"
        end
    end

    private
    def bookshelf_params
        params.require(:bookshelf).permit(:name, :description, :user_id)
    end

    def set_user_bookshelf
        @bookshelf = Bookshelf.find_by(id: params[:id])
        unless @bookshelf.user == current_user
            flash[:danger] = "This is not your bookshelf"
            redirect_to bookshelves_path
        end
    end

    def set_user
        @user = User.find_by(id: params[:user_id])
    end
end
