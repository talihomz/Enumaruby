require 'enumerable_extension'

describe Enumerable do

  before do
    @test_array = (1..4).to_a
  end

  describe "#my_each" do

    it "performs specified operation on all elements" do
      expected = [2,3,4,5]
      actual = []
      @test_array.my_each { |x| actual << x + 1 }

      expect(actual).to eq(expected)
    end

    it "doesn't modify original array" do
      expected = [1,2,3,4]
      actual = @test_array.my_each { |x| x + 12 }

      expect(actual).to eq(expected)
    end

  end

  describe "#my_each_with_index" do

    it "doesn't modify original array" do
      expected = [1,2,3,4]
      actual = @test_array.my_each_with_index { |x, idx| x + 12 }

      expect(actual).to eq(expected)
    end

    it "performs each operation using index" do
      expected = [0,1,2,3]
      actual = []
      @test_array.my_each_with_index { |x, idx| actual << idx  }

      expect(actual).to eq(expected)
    end
  end
end
