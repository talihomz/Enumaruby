require 'enumerable_extension'

describe Enumerable do

  subject { (1..4).to_a }

  describe "#my_each" do

    it "doesn't modify original array" do
      subject.my_each { |x| x + 12 }

      expect(subject).to eq([1,2,3,4])
    end

    it "performs specified operation on all elements" do
      result = []
      subject.my_each { |x| result << x + 1 }

      expect(result).to eq([2,3,4,5])
    end

  end

  describe "#my_each_with_index" do

    it "doesn't modify original array" do
      subject.my_each_with_index { |x, idx| x + 12 }

      expect(subject).to eq([1,2,3,4])
    end

    it "performs each operation on all indices" do
      result = []
      subject.my_each_with_index { |x, idx| result << idx  }

      expect(result).to eq([0,1,2,3])
    end

    it "performs specified operation on all elements" do
      result = []
      subject.my_each_with_index { |x| result << x + 1 }

      expect(result).to eq([2,3,4,5])
    end

    it "performs each operation on specific indices" do
      result = []
      subject.my_each_with_index { |x, idx| result << idx if idx.even?  }

      expect(result).to eq([0,2])
    end
  end

  describe "#my_select" do
    it "doesn't modify original array" do
      subject.my_select { |x| x + 12 }

      expect(subject).to eq([1,2,3,4])
    end

    it "returns correct elements based on predicate given" do
      expect(subject.my_select { |x| x % 2 != 0 }).to eq([1,3])
    end
  end

  describe "#my_inject" do

    it "doesn't modify original array" do
      subject.my_inject { |x, y| x + y }

      expect(subject).to eq([1,2,3,4])
    end

    context "returns a sumaric value of some operation performed on all elements" do
      it 'returns 24' do
        expect(subject.my_inject { |x, y| x * y }).to eq(24)
      end
    end
  end

  describe "#my_count" do

    it "doesn't modify original array" do
      subject.my_count { |x| x }

      expect(subject).to eq([1,2,3,4])
    end

    context "counts elements based on a given predicate" do
      it 'returns 3' do
        expect(subject.my_count { |x| x.between?(1,3) }).to eq(3)
      end
    end
  end

  describe "#my_all?" do

    it "doesn't modify original array" do
      subject.my_all? { |x| x }

      expect(subject).to eq([1,2,3,4])
    end

    context "when all elements don't meet the predicate" do
      it 'returns false' do
        expect(subject.my_all? { |x| x > 2 }).to eq(false)
      end
    end

    context "when all elements meet the predicate" do
      it 'returns true' do
        expect(subject.my_all? { |x| x.between?(1,4) }).to eq(true)
      end
    end
  end
end