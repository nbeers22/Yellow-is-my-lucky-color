
class Flashcards
	def initialize
		@cards = {

	"does michael have a beard?" => "yes",
	"what is michael's favorite word?" => "meow",
	"this is a question?" => "answer"
}

	end

	def get_cards
		@cards 
	end

end




class Controller



	def initialize
		flashcards = Flashcards.new
		@correct_count = 0
		@incorrect_count = 0
		@cards = flashcards.get_cards
	end

	def return_random_def
		@def_answer_pair = Hash[@cards.to_a.sample(1)]
		definition = @def_answer_pair.keys[0]
		return definition 

		return @cards 
	end

	def check_answer(input)    #returns true if input string is correct
		correct = @def_answer_pair.values[0]==input

		if correct
			@correct_count +=1 
			return "Correct!"
		else
			@incorrect_count +=1 
			return "Incorrect"
		end
		# return correct 
	end

	def correct_count
		@correct_count
	end

	def incorrect_countr
		@incorrect_count
	end

end



class View
	def self.parse_input

		@controller = Controller.new

		 puts "Welcome to Sort Out Your Confusion Flashcards!"
   		 puts "Are you ready to rumble? (Y/N)"


		self.print_stuff if gets.chomp.downcase=="y"

	end

	
	def self.print_stuff(input="y")
			puts @controller.return_random_def unless input=="q"

			input = gets.chomp
		  	puts @controller.check_answer(input) unless input=="q"

		  	print_stuff unless input=="q"
		 	return 

	end


	def self.quit
		puts "You got #{@controller.correct_count} answers right"
	end


end




View.parse_input
View.quit
# class View
# 	controller = Controller.new

# end