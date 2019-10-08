class AuthorsController < ApplicationController
  def show
    @author = Book.find_by(id: params[:id])
  end
end
