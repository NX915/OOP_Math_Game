class Player
  attr_reader :name
  attr_accessor :score, :lives

  def initialize(name)
    @name = name
    @score = 0
    @lives = 3
  end

  def scored
    @score += 1
  end
end