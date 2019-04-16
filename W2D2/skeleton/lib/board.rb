require "byebug"
class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = [[], [], [], [], [], [], [], [], [], [], [], [], [], []]
    place_stones
  end

  def place_stones
     cups.each do |cup|
       4.times do
          cup << :stone
       end
      end

    cups[6] = []
    cups[13] = []
  end

  def valid_move?(start_pos)
    unless cups.include?(start_pos)
      raise "Invalid starting cup"
    end
    debugger
    if cups[start_pos].empty?
      raise "Starting cup is empty"
    end
  end

  def make_move(start_pos, current_player_name)
    stones = cups[start_pos].dup
    cups[start_pos] = []
    stones.count.times do |i|
      cups[start_pos + 1 + i] << :stone
    end

    render
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    player_1_cups = [0, 1, 2, 3, 4, 5]
    player_2_cups = [7, 8, 9, 10, 11, 12]
    player_1_count = 0
    player_2_count = 0

    player_1_cups.each do |idx|
      player_1_count +=1 unless cups[idx].empty?
    end

    player_2_cups.each do |idx|
      player_2_count +=1 unless cups[idx].empty?
    end

    return true if player_1_count == 0 || player_2_count == 0
    false
  end

  def winner
  end
end
