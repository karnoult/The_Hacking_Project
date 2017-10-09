def jean_michel_data(corpus, dictionary, occurences)
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
end

def find_text_in_file(filename, dictionary)
	occurences = Hash.new(0)

	f = File.open(filename, "r") 
	f.each_line do |line|
		jean_michel_data(line, dictionary, occurences)
	end

	return occurences
end
 
dictionary = ["the", "of", "and", "to", "a", "in", "for", "is", "on", "that", "by", "this", "with", "i", "you", "it", "not", "or", "be", "are"]

puts find_text_in_file('shakespeare.txt', dictionary)
