require "./question"
require "./player"

class Game
  def initialize
    @p1 = Player.new('Player 1')
    @p2 = Player.new('Player 2')
  end

  def ask_question
    if @p2.lives != 0
      question = Question.new
      p1_number_1 = question.number_1
      p1_number_2 = question.number_2
      p1_answer = question.answer

      puts "#{@p1.name}: What does #{p1_number_1} plus #{p1_number_2} equal?"
      print "> "
      p1_input = gets.chomp.to_i

      validate_answer(@p1, p1_input, p1_answer)
      lives_remaining
    end

    if @p1.lives != 0
      question = Question.new
      p2_number_1 = question.number_1
      p2_number_2 = question.number_2
      p2_answer = question.answer

      puts "#{@p2.name}: What does #{p2_number_1} plus #{p2_number_2} equal?"
      print "> "
      p2_input = gets.chomp.to_i

      validate_answer(@p2, p2_input, p2_answer)
      lives_remaining
    end

    if @p1.lives != 0 && @p2.lives != 0
      ask_question
    end
  end

  def validate_answer(player, input, answer)
    player == @p1 ? 
    (if input == answer
      puts "#{@p1.name}: YES! You are correct."
    else 
      puts "#{@p1.name}: Seriously? No!"
      @p1.lives -= 1
    end) : 
    (if input == answer
    puts "#{@p2.name}: YES! You are correct."
    else 
      puts "#{@p2.name}: Seriously? No!"
      @p2.lives -= 1
    end)
  end

  def lives_remaining 
    if @p1.lives == 0
      puts "#{@p2.name} wins with a score of #{@p2.lives}/3"
      puts "----- GAME OVER -----"
      puts "Good bye!"
    elsif @p2.lives == 0
      puts "#{@p1.name} wins with a score of #{@p1.lives}/3"
      puts "----- GAME OVER -----"
      puts "Good bye!"
    else 
      puts "P1: #{@p1.lives}/3 vs P2: #{@p2.lives}/3"
    end
  end

end