=begin

MathGame
allow game setup and ending. take in user input and display game interface
-turn number
-total players
-current player

Player
keep track of players
-lives
-score

Question
create questions and determine if answer is correct
-question
-answer

=end
require './player'
require './question'

class MathGame
  attr_accessor :players, :current, :is_over
  attr_reader :max

  def initialize
    player1 = Player.new("Player 1")
    player2 = Player.new("Player 2")

    @players = [player1, player2]
    @current = 0
    @max = 2
    @is_over = false
  end

  def play
    puts "Game start!"

    while @is_over == false
      question = Question.new

      puts "#{self.players[self.current].name}: #{question.question}"
      answer = gets.chomp
      
      if (question.is_correct(answer))
        puts "#{self.players[self.current].name}: YES! You are correct."
        self.players[self.current].scored
      else
        puts "#{self.players[self.current].name}: Seriously? No! It was #{question.answer}"
        self.players[self.current].lives -= 1
      end

      if(self.players[self.current].lives == 0)
        self.is_over = true
        self.next_player
        puts "#{self.players[self.current].name} wins with a score of #{self.players[self.current].lives}/3 and answered #{self.players[self.current].score} questions right"
        puts "----- Game Over -----"
      else
        puts "P1: #{self.players[0].lives}/3 vs P2: #{self.players[1].lives}/3"
        puts "----- NEW TURN -----"
      end

      self.next_player
    end
  end

  def next_player
    self.current += 1
    if (self.current == self.max)
      self.current = 0
    end
  end

end

game = MathGame.new
game.play