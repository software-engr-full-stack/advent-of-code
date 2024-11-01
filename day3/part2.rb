module Part2 # rubocop:disable Metrics/ModuleLength
  include Common

  GEAR_CHAR = '*'.freeze

  # Create debug.input with "surround" scenarios
  # [0] [1] [2] [3]
  # [0] [1] [2] [3]
  # [0] [1] [2] [3]
  # [0] [1] [2] [3]
  def part2 # rubocop:disable Metrics/CyclomaticComplexity
    found = []
    rx = 0
    # rubocop:disable Metrics/BlockNesting
    while rx < matrix.count
      row = matrix[rx]
      cx = 0
      while cx < matrix_row_length
        char = row[cx]

        if char_is_numeric?(char) || char == NOTHING_CHAR
          cx += 1
          next
        end

        # p(rx:, cx:, char:, cond: char == GEAR_CHAR)
        if char == GEAR_CHAR
          upper = upper_adjacent_number_indexes(cx, rx)
          side = side_adjacent_number_indexes(cx, row)
          lower = lower_adjacent_number_indexes(cx, rx)

          if upper.count + side.count + lower.count != 2
            cx += 1
            next
          end

          found.push([
            *get_numbers(upper, matrix[rx - 1]),
            *get_numbers(side, row),
            *get_numbers(lower, matrix[rx + 1])
          ].inject(&:*))
        end

        cx += 1
      end
      rx += 1
    end
    # rubocop:enable Metrics/BlockNesting

    return found.inject(&:+)
  end

  def upper_adjacent_number_indexes(char_ix, row_ix)
    return [] if row_ix.zero?

    upper_row = matrix[row_ix - 1]

    ix = char_ix
    return [ix] if char_is_numeric?(upper_row[ix])

    found = []

    ix = char_ix - 1
    found.push(ix) if !ix.negative? && char_is_numeric?(upper_row[ix])

    ix = char_ix + 1
    found.push(ix) if ix < matrix_row_length && char_is_numeric?(upper_row[ix])

    return found
  end

  def side_adjacent_number_indexes(char_ix, row)
    found = []

    ix = char_ix - 1
    found.push(ix) if !ix.negative? && char_is_numeric?(row[ix])

    ix = char_ix + 1
    found.push(ix) if ix < matrix_row_length && char_is_numeric?(row[ix])

    return found
  end

  def lower_adjacent_number_indexes(char_ix, row_ix)
    return [] if row_ix >= (matrix.count - 1)

    lower_row = matrix[row_ix + 1]

    ix = char_ix
    return [ix] if char_is_numeric?(lower_row[ix])

    found = []

    ix = char_ix - 1
    found.push(ix) if !ix.negative? && char_is_numeric?(lower_row[ix])

    ix = char_ix + 1
    found.push(ix) if ix < matrix_row_length && char_is_numeric?(lower_row[ix])

    return found
  end

  def get_numbers(indexes, row)
    numbers = []
    return [] if !row

    indexes.each do |ix|
      num, = get_number(row[ix], ix, row)

      numbers.push num.to_i
    end

    return numbers
  end
end
