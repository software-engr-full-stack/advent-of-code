require 'test/unit'
require_relative 'day'

class TestDay < Test::Unit::TestCase
  def test_calc
    tests = [
      { fbname: 'test.input', expected: 4361 },
      { fbname: 'actual.input', expected: 535_078 }
    ]

    tests.each do |test_item|
      test_item => {fbname:, expected:}
      assert_equal(
        expected,
        Day.new(File.join(__dir__, fbname)).calc
      )
    end
  end
end
