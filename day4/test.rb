require 'test/unit'
require_relative 'part1'
require_relative 'part2'

class TestDay < Test::Unit::TestCase
  def test_part1
    tests = [
      { fbname: 'test.input', expected: 13 },
      { fbname: 'actual.input', expected: 24_160 }
    ]

    tests.each do |test_item|
      test_item => {fbname:, expected:}
      assert_equal(
        expected,
        Part1.new(File.join(__dir__, fbname)).calc
      )
    end
  end

  def test_part2
    tests = [
      { fbname: 'test.input', expected: 30 },
      { fbname: 'actual.input', expected: 5_659_035 }
    ]

    tests.each do |test_item|
      test_item => {fbname:, expected:}
      assert_equal(
        expected,
        Part2.new(File.join(__dir__, fbname)).calc
      )
    end
  end
end
