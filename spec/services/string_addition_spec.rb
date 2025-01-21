require 'rails_helper'

RSpec.describe StringAddition do
  describe '#add' do
    it 'calculate sum of valid numbers' do
      input = '1, 2, 3'
      result = StringAddition.new(input).add
      expect(result).to eq(6)
    end
  end
end
