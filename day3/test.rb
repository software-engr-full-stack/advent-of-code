require 'test/unit'
require_relative 'day'

class TestDay < Test::Unit::TestCase
  def test_part1
    tests = [
      { fbname: 'test.input', expected: 4361 },
      { fbname: 'actual.input', expected: 535_078 }
    ]

    tests.each do |test_item|
      test_item => {fbname:, expected:}
      assert_equal(
        expected,
        Day.new(File.join(__dir__, fbname)).part1
      )
    end
  end

  def test_part2
    tests = [
      { fbname: 'test.input', expected: 467_835 },
      { fbname: 'actual.input', expected: 75_312_571 }
    ]

    tests.each do |test_item|
      test_item => {fbname:, expected:}
      assert_equal(
        expected,
        Day.new(File.join(__dir__, fbname)).part2
      )
    end
  end
end
