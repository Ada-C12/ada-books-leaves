require "test_helper"

describe BooksHelper do
  describe "view badge adder" do
    it "gives the right number" do
      num = 6

      value = view_badge_adder(num)

      expect(value).must_include num.to_s
    end
  end
end