require "test_helper"

describe Book do
  describe 'validations' do
    before do
      # Arrange
      author = Author.new(name: 'test author')
      @book = Book.new(title: 'test book', author: author, publication_date: 2019)
    end

    it 'is valid when all fields are present' do
      # Act
      result = @book.valid?

      # Assert
      expect(result).must_equal true
    end

    it 'is invalid without a title' do
      @book.title = nil

      expect(@book.valid?).must_equal false
      expect(@book.errors.messages).must_include :title
    end

    it 'is invalid without a proper publication date' do
      @book.publication_date = "abc"

      expect(@book.valid?).must_equal false
      expect(@book.errors.messages).must_include :publication_date


      @book.publication_date = nil

      expect(@book.valid?).must_equal false
      expect(@book.errors.messages).must_include :publication_date

      @book.publication_date = 5

      expect(@book.valid?).must_equal false
      expect(@book.errors.messages).must_include :publication_date
    end
  end
end
