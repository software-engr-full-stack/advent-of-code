require 'test/unit'
require_relative 'day'

class TestDay < Test::Unit::TestCase
  def test_day
    tests = [
      { fbname: 'test.input', expected: 8 },
      { fbname: 'actual.input', expected: 2207 }
    ]

    tests.each do |test_item|
      test_item => {fbname:, expected:}
      assert_equal(
        expected,
        Day.new(File.join(__dir__, fbname)).calc('12 red cubes, 13 green cubes, 14 blue')
      )
    end
  end
end
