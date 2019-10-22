class Book < ApplicationRecord
  belongs_to :author
  has_and_belongs_to_many :genres


  # validations
  validates :title, presence: true, uniqueness: true
  validates :publication_date, numericality: { only_integer: true, greater_than: 5}
  #validates :description, presence: true, length: { minimum: 25 }

  def self.alpha_books
    return Book.order(title: :asc)
  end
end
