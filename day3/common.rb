module Common
  NOTHING_CHAR = '.'.freeze

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
end
