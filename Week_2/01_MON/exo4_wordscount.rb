def jean_michel_data(corpus, dictionary)

	occurences = Hash.new(0) 

	#corpus : update to downcase and split words
	corpus_words = corpus.downcase.split(' ')

	#navigate through dictionary
	dictionary.each do |dictionary_word|
		
		#navigate through corpus
		corpus_words.each do |corpus_word|
	
			#increment hash if the dictionary word is found in the corpus
			occurences[dictionary_word] += 1 if corpus_word.include? dictionary_word

		end

	end

	return occurences
end

corpus = "Howdy partner, sit down! How's it going?"

dictionary = ["below", "down", "go", "going", "horn", "how", "howdy", "it", "i", "low", "own", "part", "partner", "sit"]	
puts jean_michel_data(corpus, dictionary)
