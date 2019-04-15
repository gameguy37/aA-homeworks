class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    puts "Remember this sequence"
    until @game_over
      self.take_turn
    end
  end

  def take_turn
    self.show_sequence
    sleep(3)
    system("clear")
    self.require_sequence
    unless @game_over
        @sequence_length += 1
    end
  end

  def show_sequence
    self.add_random_color
    puts @seq
  end

  def require_sequence
    correct = @seq.dup
    puts "Type the sequence back, one color at a time."
    while correct.length > 0
      response = gets.chomp
      first = correct.shift
      unless response == first
        @game_over = true
        self.game_over_message
        puts " "
        self.reset_game
      end
      system("clear")
      self.round_success_message
    end

    #this method still doesn't work the way I'd like it to, it
    #displays the message "Go on..." when it should instead indicate
    #the player was correct and the sequence is being lengthened.

  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    puts "Go on..."
  end

  def game_over_message
    puts "GAME OVER!!!" if @game_over
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
    self.play
  end

end

s = Simon.new
s.play