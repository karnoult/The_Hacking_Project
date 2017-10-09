def jean_michel_data(corpus, dictionary, occurences)
	#corpus : update to downcase and split words
	corpus_words = corpus.downcase.split(' ')

	#navigate through dictionary
	dictionary.each do |dictionary_word|
		
		#navigate through corpus
		corpus_words.each do |corpus_word|
			
			if corpus_word.include? dictionary_word
				#add to the occurences hash
				if occurences.has_key? dictionary_word
					occurences[dictionary_word] = (occurences[dictionary_word] + 1)
				else
					occurences[dictionary_word] = 1
				end
			end
			
		end
	end
end

def find_text_in_file(filename, dictionary)
	occurences = {}

	f = File.open(filename, "r") 
	f.each_line do |line|
		jean_michel_data(line, dictionary, occurences)
	end

	puts occurences
end
 
dictionary = ["below", "down", "go", "going", "horn", "how", "howdy", "it", "i", "low", "own", "part", "partner", "sit"]	

find_text_in_file('shakespeare.txt', dictionary)