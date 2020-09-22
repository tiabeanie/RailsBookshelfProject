class EntriesController < ApplicationController
    before_action :require_login
    before_action :set_entry, only: [:edit, :update, :destroy, :show]

    def new
        @entry = Entry.new
        @entry.book = Book.find_by(id: params[:book_id])
    end

    def show
    end

    def create
        @entry = Entry.new(entry_params)
        @entry.book = Book.find_by(id: params[:book_id])
        if @entry.save
            flash[:message] = "#{@entry.book.title} has been added to your bookshelf"
            redirect_to book_path(@entry.book)
        else
            render :new
        end
    end

    def edit
    end

    def update
        @entry.update(entry_params)
        if @entry.save
            flash[:message] = "#{@entry.book.title} entry has been updated"
            redirect_to book_path(@entry.book)
        else
            render :edit
        end
    end

    def destroy
        if @entry
            @entry.destroy
            flash[:message] = "The book has been removed from your bookshelf"
            redirect_to bookshelves_path
        else
            flash[:danger] = "The book could not be removed"
            render 'books/show'
        end
    end

    private 
    def entry_params
        params.require(:entry).permit(:bookshelf_id, :user_id, :user_notes)
    end

    def set_entry
        @entry = Entry.find_by(id: params[:id])
    end
end
