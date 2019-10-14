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

    it 'is invalid if the title is not unique' do
      # @book.title = Book.first.title
      @book.title = books(:kittens).title
      # book_2 = Book.create( title: @book.title, author: @book.author, publication_date: 2019)

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

  describe 'relations' do
    it "has an author" do
      book = books(:poodr)
      book.author.must_equal authors(:metz)
    end

    it "can set the author" do
      book = Book.new(title: "test book")
      book.author = authors(:metz)
      book.author_id.must_equal authors(:metz).id
    end
  end

  describe 'custom methods' do
  
    describe 'alpha_books' do
      it 'properly alphabetizes the books' do
        test_list = Book.alpha_books

        expect( test_list[0].title ).must_equal books(:kindred).title
        expect( test_list[-1].title ).must_equal books(:kittens).title

      end
    end
  
  end

  # describe 'relations' do
  #   it 'can set the author through "author"' do
  #     # Create two models
  #     author = Author.create!(name: "test author")
  #     book = Book.new(title: "test book")

  #     # Make the models relate to one another
  #     book.author = author

  #     # author_id should have changed accordingly
  #     expect(book.author_id).must_equal author.id
  #   end

  #   it 'can set the author through "author_id"' do
  #     # Create two models
  #     author = Author.create!(name: "test author")
  #     book = Book.new(title: "test book")

  #     # Make the models relate to one another
  #     book.author_id = author.id

  #     # author should have changed accordingly
  #     expect(book.author).must_equal author
  #   end
  # end
end
