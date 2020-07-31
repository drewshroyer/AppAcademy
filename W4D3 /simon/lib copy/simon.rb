git inclass Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    if @game_over == true 
      self.game_over_message
      self.reset_game
    else
      self.take_turn
    end
  end

  def take_turn
    self.show_sequence
    self.require_sequence

    unless @game_over
      self.round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    self.add_random_color
    @seq.each do |color|
      puts color
      sleep 0.75
      system("clear")
      sleep 0.25
    end
  end

  def require_sequence
    puts "repeat the sequence by inputting the first letter of the color. enter a line down between each color."
  
    @seq.each do |color|
      input = gets.chomp
      if color.first != input
        @game_over = true
        break
      end
    end
    sleep 0.25
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    puts "nice sequence!"
  end

  def game_over_message
    puts "SORRY YOU LOSEEEE"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end
