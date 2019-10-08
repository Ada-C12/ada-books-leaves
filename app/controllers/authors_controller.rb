class AuthorsController < ApplicationController
  def index
    @authors = Author.all
  end

  def show
    @author = Book.find_by(id: params[:id])
  end
end
