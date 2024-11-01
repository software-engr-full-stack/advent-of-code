class Part2
  def initialize(input_file_name)
    @lines = File.foreach(input_file_name).collect(&:strip).reject(&:empty?)
  end

  def calc # rubocop:disable Metrics/CyclomaticComplexity
    cards = {}
    lines.each.with_index do |line, card_ix|
      _, nums_str = line.split(/\s*:\s*/)
      wns, ons = nums_str.split(/\s*\|\s*/)
      winning_numbers = wns.split(/\s+/).collect(&:to_i)
      own_numbers = ons.split(/\s+/).collect(&:to_i)

      inter = winning_numbers & own_numbers

      cards[card_ix] = cards[card_ix] ? cards[card_ix] + 1 : 1

      next if !inter.count.positive?

      cards[card_ix].times do
        inter.count.times do |ix|
          next_card_ix = card_ix + ix + 1
          cards[next_card_ix] = cards[next_card_ix] ? cards[next_card_ix] + 1 : 1
        end
      end
    end

    cards.values.inject(&:+)
  end

  private

  attr_reader :lines
end
