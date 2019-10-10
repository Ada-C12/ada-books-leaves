class AuthorsController < ApplicationController
  def index
    @authors = Author.all
  end

  def show
    @author = Author.find_by(id: params[:id])
  end

  def new
    # This is the 'regular' route, /books/new
    @author = Author.new
  end
  
  def create
    @author = Author.new(name: params[:author][:name]) #instantiate a new book
    if @author.save # save returns true if the database insert succeeds
      redirect_to authors_path # go to the index so we can see the book in the list
      return
    else # save failed :(
      render :new # show the new book form view again
      return
    end
  end
end
