class StringAddition
  DEFAULT_DELIMITERS = [',', '\n'].freeze

  def initialize(string_input)
    @input = string_input
  end

  def add
    delimiters, numbers_part = get_delimeters_and_numbers
    numbers = split_numbers(numbers_part, delimiters)
    negatives = find_negatives(numbers)

    raise ArgumentError, "Negatives not allowed: #{negatives.join(', ')}" if negatives.any?
    numbers.sum
  end

  private

  def get_delimeters_and_numbers
    if @input.start_with?('//')
      match = @input.match(%r{//(.+)\n(.*)})
      [match[1].chars, match[2]] if match
    else
      [DEFAULT_DELIMITERS, @input]
    end
  end

  def split_numbers(numbers_part, delimiters)
    delimiters_regex = Regexp.union(delimiters)
    numbers_part.split(delimiters_regex).map(&:to_i)
  end

  def find_negatives(numbers)
    numbers.select { |num| num < 0 }
  end
end
