class Question
  attr_reader :number_1, :number_2

  def initialize
    @number_1 = rand(1..20)
    @number_2 = rand(1..20)
  end

  def answer
    return @number_1 + @number_2
  end
end