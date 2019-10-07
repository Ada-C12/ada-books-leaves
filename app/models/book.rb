class Book < ApplicationRecord
  belongs_to :author

  def self.alpha_books
    return Book.order(title: :asc)
  end
end
