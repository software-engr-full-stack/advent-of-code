require 'test/unit'
require_relative 'day'

class TestDay < Test::Unit::TestCase
  def test_part1
    tests = [
      { fbname: 'test.input', expected: 8 },
      { fbname: 'actual.input', expected: 2207 }
    ]

    tests.each do |test_item|
      test_item => {fbname:, expected:}
      assert_equal(
        expected,
        Day.new(File.join(__dir__, fbname)).part1('12 red cubes, 13 green cubes, 14 blue')
      )
    end
  end

  def test_part2
    tests = [
      { fbname: 'test.input', expected: 2286 },
      { fbname: 'actual.input', expected: 62_241 }
    ]

    tests.each do |test_item|
      test_item => {fbname:, expected:}
      assert_equal(expected, Day.new(File.join(__dir__, fbname)).part2)
    end
  end
end
