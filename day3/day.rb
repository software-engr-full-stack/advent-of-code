require_relative 'part1'

class Day
  def initialize(input_file_name)
    @lines = File.foreach(input_file_name).collect(&:strip).reject(&:empty?)
  end

  include Part1

  private

  attr_reader :lines
end
