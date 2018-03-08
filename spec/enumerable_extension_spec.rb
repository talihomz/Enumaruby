require 'enumerable_extension'

describe Enumerable do

  # before do
  #   @test_array = (1..4).to_a
  # end

  let(:test_array) { (1..4).to_a }

  describe "#my_each" do

    it "doesn't modify original array" do
      test_array.my_each { |x| x + 12 }

      expect(test_array).to eq([1,2,3,4])
    end

    it "performs specified operation on all elements" do
      expected = [2,3,4,5]
      actual = []
      test_array.my_each { |x| actual << x + 1 }

      expect(actual).to eq(expected)
    end

  end

  describe "#my_each_with_index" do

    it "doesn't modify original array" do
      test_array.my_each_with_index { |x, idx| x + 12 }

      expect(test_array).to eq([1,2,3,4])
    end

    it "performs each operation using index" do
      expected = [0,1,2,3]
      actual = []
      test_array.my_each_with_index { |x, idx| actual << idx  }

      expect(actual).to eq(expected)
    end
  end

  describe "#my_select" do
    it "doesn't modify original array" do
      test_array.my_select { |x| x + 12 }

      expect(test_array).to eq([1,2,3,4])
    end

    it "returns correct elements based on predicate given" do
      expected = [1,3]
      actual = test_array.my_select { |x| x % 2 != 0 }

      expect(actual).to eq(expected)
    end
  end

  describe "#my_inject" do

    it "doesn't modify original array" do
      test_array.my_inject { |x, y| x + y }

      expect(test_array).to eq([1,2,3,4])
    end

    context "given a block { |x, y| x + y }" do
      it 'returns 10' do
        actual = test_array.my_inject { |x, y| x + y }

        expect(actual).to eq(10)
      end
    end

    context "given a block { |x, y| x * y }" do
      it 'returns 24' do
        actual = test_array.my_inject { |x, y| x * y }

        expect(actual).to eq(24)
      end
    end
  end

  describe "#my_count" do

    it "doesn't modify original array" do
      test_array.my_count { |x| x }

      expect(test_array).to eq([1,2,3,4])
    end

    context "given a block { |x| x > 2 }" do
      it 'returns 2' do
        actual = test_array.my_count { |x| x > 2 }

        expect(actual).to eq(2)
      end
    end

    context "given a block { |x| x.between?(1,3) }" do
      it 'returns 3' do
        actual = test_array.my_count { |x| x.between?(1,3) }

        expect(actual).to eq(3)
      end
    end
  end

  describe "#my_all?" do

    it "doesn't modify original array" do
      test_array.my_all? { |x| x }

      expect(test_array).to eq([1,2,3,4])
    end

    context "given a block { |x| x > 2 }" do
      it 'returns false' do
        actual = test_array.my_all? { |x| x > 2 }

        expect(actual).to eq(false)
      end
    end

    context "given a block { |x| x.between?(1,4) }" do
      it 'returns true' do
        actual = test_array.my_all? { |x| x.between?(1,4) }

        expect(actual).to eq(true)
      end
    end
  end
end
