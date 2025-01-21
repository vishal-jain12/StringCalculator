class StringAddition
  DEFAULT_DELIMITERS = [',', '\n'].freeze

  def initialize(string_input)
    @input = string_input
  end

  def add
    split_numbers.sum
  end

  def split_numbers
    delimiters_regex = Regexp.union(DEFAULT_DELIMITERS)
    @input.split(delimiters_regex).map(&:to_i)
  end
end
