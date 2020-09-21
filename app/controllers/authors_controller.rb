class AuthorsController < ApplicationController
    before_action :require_login

    def index
        @authors = Author.all 
    end

    def show
        @author = Author.find_by(id: params[:id])
    end

    def book 
        @author = Author.find_by(id: params[:id])
        @books = @author.books
    end
end
