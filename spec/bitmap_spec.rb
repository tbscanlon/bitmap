require 'bitmap'

describe Bitmap do
  subject(:bitmap) { described_class.new(x: 3, y: 4) }

  describe '#show' do
    context 'With a valid image' do

      before(:each) do
        allow(STDOUT).to receive(:puts)
      end

      it 'shows an image' do
        expect { bitmap.show }.to output("000\n000\n000\n000\n").to_stdout
      end
    end
  end

  describe '#draw_colour' do
    it 'changes the colour of a pixel' do
      bitmap.draw_colour(x: 2, y: 1, colour: "B")
      expect(bitmap.image).to eq [["0", "0", "0"], ["B", "0", "0"], ["0", "0", "0"], ["0", "0", "0"]]
    end

    context 'when drawing outside of image' do
      it 'errors' do
        expect { bitmap.draw_colour(x: 5, y: 5, colour: 'B') }.to raise_error('no')
      end
    end
  end

  describe '#clear' do
    before do
      bitmap.draw_colour(x: 2, y: 1, colour: "B")
    end

    it 'clears bitmap after drawing' do
      bitmap.clear
      expect(bitmap.image).to eq [["0", "0", "0"], ["0", "0", "0"], ["0", "0", "0"], ["0", "0", "0"]]
    end
  end
end
