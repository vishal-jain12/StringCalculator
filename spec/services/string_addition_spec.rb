require 'rails_helper'

RSpec.describe StringAddition do
  describe '#add' do
    context 'with valid inputs' do
      it 'calculate sum of valid numbers and common delimeters (comma, newline)' do
        input = '1, 2, 3'
        result = StringAddition.new(input).add
        expect(result).to eq(6)
      end

      it 'calculate sum with custom delimeters' do
        input = "//;\n1;18;2003;3"
        result = StringAddition.new(input).add
        expect(result).to eq(2025)
      end

      it 'handles long input' do
        input = "//;\n10000;3;55"
        result = StringAddition.new(input).add
        expect(result).to eq(10058)
      end

      it 'return 0 for an empty string' do
        input = ''
        result = StringAddition.new(input).add
        expect(result).to eq(0)
      end
    end

    context 'with invalid inputs' do
      it 'raises exception for negative numbers' do
        input = "//;\n1;8;-2;3"
        expect { StringAddition.new(input).add }.to raise_error(ArgumentError, 'Negatives not allowed: -2')
      end
    end
  end
end
