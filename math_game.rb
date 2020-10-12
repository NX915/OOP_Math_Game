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

class MathGame
  def initialize
    @player1 = Player.new("Player 1")
    @player2 = Player.new("Player 2")
  end

  def play
    question = Question.new

    puts "Game start!"
    puts "#{@player1.name}: #{question.question}"
    answer = gets.chomp
    
    puts answer == question.answer
  end
end

class Player
  attr_reader :name

  def initialize(name)
    @name = name
    @score = 0
    @lives = 3
  end
end

class Question
  attr_reader :question, :answer

  def initialize
    @question = "What is 1 + 1"
    @answer = "2"
  end
end

game = MathGame.new
game.play