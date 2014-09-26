class Flashcards

	# def initialize
		# @file = 'flashcard_samples.txt'
		@@correct_count = 0
		@@incorrect_count = 0
	# end

	def self.get_cards
		card_array = []
		new_card_array = []

		File.open('./flashcard_samples.txt', 'r').each_line do |line|
			card_array << line.chomp
		end

		card_array.delete("")
		card_array.each_slice(2){ |slice| new_card_array << slice } # 2-D array: description, answer
		@cards = Hash[new_card_array.map {|key, value| [key, value]}] # hash where key is description, value is answer
		return @cards
	end

	def self.return_random_def
		flashcards = Flashcards.get_cards
		@def_answer_pair = Hash[flashcards.to_a.sample(1)]
		p @def_answer_pair
		definition = @def_answer_pair.keys[0]
		puts "#{definition}"
		gets.chomp.downcase 
	end

	def self.check_answer(input)    #returns true if input string is correct
		correct = @def_answer_pair.values[0]==input

		if correct
			@@correct_count += 1 
			View.correct
			return_random_def
		else
			@@incorrect_count += 1 
			View.incorrect
			return_random_def
		end
		# return correct 
	end

	def self.correct_count
		@@correct_count
	end

	def self.incorrect_count
		@@incorrect_count
	end

end

class View

  def self.prompt
    puts "Welcome to Kitty Flashcards!"
    puts "You will get a definition. Type in the answer and press enter."
    puts "If you don't want to play anymore, enter 'meow'"
    puts "Are you ready to rumble? (Y/N)"
    gets.chomp.upcase
  end

  def self.correct 
    puts "You are super smart! You get one point!"
    puts 
  end

  def self.incorrect 
    puts "Someone hasn't been studying! That's the wrong answer."
    puts
  end

  def self.error
    puts "I don't understand your input. Please try again."
  end

  def self.exit 
    puts "Thanks for playing!" 
    puts "You got #{Flashcards.correct_count} answers right and #{Flashcards.incorrect_count} answers wrong."


  puts "                              ,----------.                              "
  puts "                            (Meo- YELLOW! )                  .-.        "
  puts "                             `-----------'                    \\ \\       "
  puts "                                   (_)                         \\ \\      "
  puts "                                       O                       | |      "
  puts "                  |\\ /\\                  o                     | |      "
  puts "  __              |,\\(_\\_                  . /\\---/\\   _,---._ | |      "
  puts " ( (              |\\,`   `-^.               /^   ^  \\,'       `. ;      "
  puts "  \\ \\             :    `-'   )             ( @   @   )           ;      "
  puts "   \\ \\             \\        ;               `.=o=__,'            \\      "
  puts "    \\ \\             `-.   ,'                  /         _,--.__   \\     "
  puts "     \\ \\ ____________,'  (                   /  _ )   ,'   `-. `-. \\    "
  puts "      ; '                ;                  / ,' /  ,'        \\ \\ \\ \\   "
  puts "      \\                 /___,-.            / /  / ,'          (,_)(,_)  "
  puts "       `,    ,_____|  ;'_____,'           (,;  (,,)      Walker         "
  puts "     ,-  \\  :      | :                                                  "
  puts "    ( .-  \\ `.__   | |                                                  "
  puts "     \\__)  `.__,'  |__)  Texas Ranger                                   "
  

  end
  
end

class Controller
	
    def self.run!
      user_input = View.prompt
      if user_input == "Y"
        Flashcards.return_random_def
		    answer = Flashcards.return_random_def
		      if answer == "meow"
		      	View.exit
		      else
		      	Flashcards.check_answer(answer)
		      end
      elsif user_input == "N"
      	View.exit
      elsif user_input == "meow"
        View.exit
      else
        View.error
      end
    end
   
end

Controller.run!
