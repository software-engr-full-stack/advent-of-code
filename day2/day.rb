class Day
  def initialize(input_file_name)
    @lines = File.foreach(input_file_name).collect(&:strip).reject(&:empty?)
  end

  def record_of_games
    return @record_of_games if @record_of_games

    @record_of_games = lines.collect do |line|
      f0, f1 = line.downcase.split(/\s*:\s*/)
      game = f0.split(/\s+/)[1]

      raise if !game
      raise if game != game.to_i.to_s

      sets = f1.split(/\s*;\s*/).collect do |str|
        string_to_bag str
      end

      {
        game: game.to_i,
        sets:
      }
    end
  end

  def calc(str)
    total = 0
    bag_to_be_checked = string_to_bag(str)
    record_of_games.each do |record|
      is_valid_game = true
      record => {game:, sets:}
      sets.each do |set|
        bag_to_be_checked.each do |key, value|
          set_value = set[key]
          next if !set_value

          if set_value > value
            is_valid_game = false
            break
          end
        end
      end

      total += game if is_valid_game
    end

    total
  end

  def string_to_bag(str)
    str.split(/\s*,\s*/).inject({}) do |memo, s1|
      value, color = s1.split(/\s+/)

      raise if value != value.to_i.to_s

      {
        **memo,
        color => value.to_i
      }
    end
  end

  private

  attr_reader :lines
end
