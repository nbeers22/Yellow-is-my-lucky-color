class Flashcards

		@@correct_count = 0
		@@incorrect_count = 0

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
		# p @def_answer_pair
		definition = @def_answer_pair.keys[0]
		puts "#{definition}"
		$input = gets.chomp.downcase
	end

	def self.check_answer(input)    #returns true if input string is correct
		if @def_answer_pair.values[0] == input
			correct = true
		end

		if correct
			@@correct_count += 1 
			View.correct
		else
			@@incorrect_count += 1 
			View.incorrect
		end
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
		if $user_input == "Y"
    		puts Flashcards.return_random_def unless $input == "q"
			puts Flashcards.check_answer($input) unless $input == "q"
    		self.run! unless $input == "q"
    	elsif $user_input == "N"
    		View.exit
    	else
    		View.error
    	end

    end   
end


$user_input = View.prompt
Controller.run!
View.exit