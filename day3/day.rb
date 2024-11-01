require_relative 'part1'
require_relative 'part2'

class Day
  def initialize(input_file_name)
    @lines = File.foreach(input_file_name).collect(&:strip).reject(&:empty?)
  end

  include Part1
  include Part2

  private

  attr_reader :lines
end
