require 'test/unit'
require_relative 'day1'

class TestDay1 < Test::Unit::TestCase
  def test_part1
    tests = [
      { fbname: 'part-1-test.input', expected: 142 },
      { fbname: 'actual.input', expected: 54_990 }
    ]

    tests.each do |test_item|
      test_item => {fbname:, expected:}
      assert_equal(expected, Day1.new(File.join(__dir__, fbname)).part1)
    end
  end

  def test_part2
    tests = [
      { fbname: 'part-2-test.input', expected: 281 },
      { fbname: 'actual.input', expected: 54_473 }
    ]

    tests.each do |test_item|
      test_item => {fbname:, expected:}
      assert_equal(expected, Day1.new(File.join(__dir__, fbname)).part2)
    end
  end
end
