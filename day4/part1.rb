class Part1
  def initialize(input_file_name)
    @lines = File.foreach(input_file_name).collect(&:strip).reject(&:empty?)
  end

  def calc
    points = []
    lines.each do |line|
      _, nums_str = line.split(/\s*:\s*/)
      wns, ons = nums_str.split(/\s*\|\s*/)
      winning_numbers = wns.split(/\s+/).collect(&:to_i)
      own_numbers = ons.split(/\s+/).collect(&:to_i)

      inter = winning_numbers & own_numbers

      points.push(2**((winning_numbers & own_numbers).count - 1)) if inter.count.positive?
    end

    points.inject(&:+)
  end

  private

  attr_reader :lines
end
