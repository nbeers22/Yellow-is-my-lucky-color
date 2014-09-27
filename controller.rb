#controller classes 
# method that returns a random definition - return_random_def

# method that checks the answer (.match?) - does_answer_match?




#model classes - get cards

# class Model


# 	def get_cards()
# 		#reads CSV

# 		output = hash 
# 		key = question
# 		value = answer 
# 	end

# 	def make_cards()
# 		take in hash, output key part of hash as a string 
# 	end

# end



class Controller

	def initialize
		@correct_count = 0
		@incorrect_count = 0
		@cards = Flashcards.get_cards
	end

	def return_random_def
		@def_answer_pair = Hash[@cards.to_a.sample(1)]
		definition = def_answer_pair.keys[0]
		return definition 
	end

	def check_answer(input)    #returns true if input string is correct
		correct = @def_answer_pair.values[0]==input

		if correct
			@correct_count +=1 
		else
			@incorrect_count +=1 
		end
		return correct 
	end

	def correct_count
		@correct_count
	end

	def incorrect_countr
		@incorrect_count
	end

end


# class View
# 	controller = Controller.new

# end