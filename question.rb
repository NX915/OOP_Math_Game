class Question
  attr_reader :question, :answer

  def initialize
    @numbers = [rand(20), rand(20)]
    @question = "What is #{@numbers[0]} + #{@numbers[1]}"
    @answer = "#{@numbers[0] + @numbers[1]}"
  end

  def is_correct(answer)
    if (@answer == answer)
      return true
    else
      return false
    end
  end

end