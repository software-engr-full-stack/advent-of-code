class Day # rubocop:disable Metrics/ClassLength
  def initialize(input_file_name)
    @lines = File.foreach(input_file_name).collect(&:strip).reject(&:empty?)
  end

  def calc # rubocop:disable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
    found = []
    rx = 0
    while rx < matrix.count
      row = matrix[rx]
      cx = 0
      while cx < matrix_row_length
        char = row[cx]

        if symbol?(char) || char == NOTHING_CHAR
          cx += 1
          next
        end

        if adjacent_to_upper? cx, rx
          num, left_steps, right_steps = get_number(char, cx, row)
          destory_found rx, cx, left_steps, right_steps
          cx += (right_steps.zero? ? 1 : (right_steps + 1)) # rubocop:disable Metrics/BlockNesting
          found.push num.to_i
          next
        end

        if adjacent_to_left? cx, row
          num, left_steps, right_steps = get_number(char, cx, row)
          destory_found rx, cx, left_steps, right_steps
          cx += (right_steps.zero? ? 1 : (right_steps + 1)) # rubocop:disable Metrics/BlockNesting
          found.push num.to_i
          next
        end

        if adjacent_to_right? cx, row
          num, left_steps, right_steps = get_number(char, cx, row)
          destory_found rx, cx, left_steps, right_steps
          cx += (right_steps.zero? ? 1 : (right_steps + 1)) # rubocop:disable Metrics/BlockNesting
          found.push num.to_i
          next
        end

        if adjacent_to_bottom? cx, rx
          num, left_steps, right_steps = get_number(char, cx, row)
          destory_found rx, cx, left_steps, right_steps
          cx += (right_steps.zero? ? 1 : (right_steps + 1)) # rubocop:disable Metrics/BlockNesting
          found.push num.to_i
          next
        end

        cx += 1
      end
      rx += 1
    end

    found.inject(&:+)
  end

  private

  attr_reader :lines

  NOTHING_CHAR = '.'.freeze
  private_constant :NOTHING_CHAR

  def matrix
    return @matrix if @matrix

    @matrix = lines.collect(&:chars)
  end

  def matrix_row_length
    return @matrix_row_length if @matrix_row_length

    @matrix_row_length = matrix.first.count
  end

  def adjacent_to_upper?(char_ix, row_ix)
    return false if row_ix.zero?

    upper_rx = row_ix - 1

    ix = char_ix - 1
    return true if !ix.negative? && symbol?(matrix[upper_rx][ix])

    ix = char_ix
    return true if symbol?(matrix[upper_rx][ix])

    ix = char_ix + 1
    return true if ix < matrix_row_length && symbol?(matrix[upper_rx][ix])

    return false
  end

  def adjacent_to_left?(char_ix, row)
    return false if char_ix.zero?

    (char_ix - 1).downto(0) do |ix|
      char = row[ix]
      return false if char == NOTHING_CHAR

      return true if symbol?(char)
    end

    return false
  end

  def adjacent_to_right?(char_ix, row)
    return false if char_ix >= (matrix_row_length - 1)

    return symbol?(row[char_ix + 1])
  end

  def adjacent_to_bottom?(char_ix, row_ix)
    return false if row_ix >= (matrix.count - 1)

    bottom_rx = row_ix + 1

    ix = char_ix - 1
    return true if !ix.negative? && symbol?(matrix[bottom_rx][ix])

    ix = char_ix
    return true if symbol?(matrix[bottom_rx][ix])

    ix = char_ix + 1
    return true if ix < matrix_row_length && symbol?(matrix[bottom_rx][ix])

    return false
  end

  def symbol?(char)
    return false if !char

    return false if char == NOTHING_CHAR

    return false if char_is_numeric?(char)

    return true
  end

  def char_is_numeric?(char)
    char == char.to_i.to_s
  end

  def get_number(char, char_ix, row)
    chars = [char]

    left_steps = 0
    if !(char_ix - 1).negative?
      row.reverse[(matrix_row_length - char_ix)..].each do |chr|
        break if !char_is_numeric?(chr)

        chars.push(chr)
        left_steps += 1
      end
    end
    chars = chars.reverse

    right_steps = 0
    if (char_ix + 1) < matrix_row_length
      row[(char_ix + 1)..].each do |chr|
        break if !char_is_numeric?(chr)

        chars.push(chr)
        right_steps += 1
      end
    end

    [chars.join, left_steps, right_steps]
  end

  def destory_found(row_ix, char_ix, left_steps, right_steps)
    char_ix.downto(char_ix - left_steps) do |ix|
      matrix[row_ix][ix] = NOTHING_CHAR
    end

    char_ix.upto(char_ix + right_steps) do |ix|
      matrix[row_ix][ix] = NOTHING_CHAR
    end
  end
end
