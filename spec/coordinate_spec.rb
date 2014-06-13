
require "./lib/coordinate.rb"

describe Coordinate do

	let(:b5)  { Coordinate.new(:B5)  }
	let(:b11) { Coordinate.new(:B11) }
	let(:one) { Coordinate.new(1)    }
	let(:a)   { Coordinate.new("a")  }

	context "knows if it's located on the (imaginary) grid or not" do
    it 'b5' do
      expect(b5.on_grid?).to be true
    end
    it 'b11' do
      expect(b11.on_grid?).to be false
    end
    it 'one' do
      expect(one.on_grid?).to be false
    end
    it 'a' do
      expect(a.on_grid?).to be false
    end
	end

	context "knows if it's a valid coordinate" do
    it 'b5' do
      expect(b5.valid?).to be true
    end
    it 'b11' do
      expect(b11.valid?).to be false
    end
    it 'one' do
      expect(one.valid?).to be false
    end
    it 'a' do
      expect(a.valid?).to be false
    end
	end

	context 'compares coordinates' do
		let(:a1) { Coordinate.new(:A1) }
		let(:a2) { Coordinate.new(:A2) }
		let(:a_one) { Coordinate.new(:A1) }

		it 'a1 <=> a2' do
			expect(a1 <=> a2).to eq -1
		end

		it 'a2 <=> a1' do
			expect(a2 <=> a1).to eq 1
		end

		it 'a1 <=> a1' do
			expect(a_one <=> a1).to eq 0
		end

	end

end
