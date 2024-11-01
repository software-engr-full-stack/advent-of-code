require_relative 'common'

module Part1
  include Common

  def part1 # rubocop:disable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
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

  def destory_found(row_ix, char_ix, left_steps, right_steps)
    char_ix.downto(char_ix - left_steps) do |ix|
      matrix[row_ix][ix] = NOTHING_CHAR
    end

    char_ix.upto(char_ix + right_steps) do |ix|
      matrix[row_ix][ix] = NOTHING_CHAR
    end
  end
end
