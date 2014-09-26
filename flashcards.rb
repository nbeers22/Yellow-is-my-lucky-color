class Flashcards

	def initialize
		@file = 'flashcard_samples.txt'
	end

	def get_cards
		card_array = []
		new_card_array = []
		@cards = {}

		File.open(@file, 'r').each_line do |line|
			card_array << line.chomp
		end

		card_array.delete("")
		card_array.each_slice(2){ |slice| new_card_array << slice } # 2-D array: description, answer
		@cards = Hash[new_card_array.map {|key, value| [key, value]}] # hash where key is description, value is answer
	end

	def return_count
		
	end

end

# cards = Flashcards.new
# cards.get_cards