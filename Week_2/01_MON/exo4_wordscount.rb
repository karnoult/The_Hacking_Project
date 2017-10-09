def jean_michel_data(corpus, dictionary)

	occurences = {}

	dictionary.each do |dictionary_word|
		corpus.downcase.split(' ').each do |corpus_word|
			if corpus_word.include? dictionary_word
				if occurences.has_key? dictionary_word
					occurences[dictionary_word] = (occurences[dictionary_word] + 1)
				else
					occurences[dictionary_word] = 1
				end
			end
		end
	end

	puts occurences

end

corpus = "Howdy partner, sit down! How's it going?"
dictionary = ["below", "down", "go", "going", "horn", "how", "howdy", "it", "i", "low", "own", "part", "partner", "sit"]	
jean_michel_data(corpus, dictionary)