#!/usr/bin/env ruby

class Day1
  DIGITS = %w(one two three four five six seven eight nine).each_with_index.to_h do |digit, ix|
    [digit, (ix + 1).to_s]
  end

  def initialize(fname)
    @input_file_name = fname
  end

  def part1
    list_of_numbers = File.foreach(input_file_name).collect do |line|
      line.chars.select do |char|
        char == char.to_i.to_s
      end
    end

    not_empty = list_of_numbers.select do |numeric_chars|
      numeric_chars.count.positive?
    end

    not_empty.collect do |numeric_chars|
      [numeric_chars[0], numeric_chars[-1]].join.to_i
    end.inject(:+)
  end

  def part2
    numbers = []
    File.foreach(input_file_name) do |line|
      digits = []
      line.chars.each.with_index do |char, ix|
        if char == char.to_i.to_s
          digits.push char
        else
          DIGITS.each do |key, value|
            digits.push(value) if line[ix..].start_with?(key.to_s)
          end
        end
      end

      numbers.push [digits[0], digits[-1]].join.to_i if digits.count.positive?
    end

    numbers.inject(:+)
  end

  private

  attr_reader :input_file_name
end
