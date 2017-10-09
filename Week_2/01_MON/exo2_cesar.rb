def chiffre_de_cesar(initial_text, shift)
	final_text = ""
	
	#passer sur toutes les lettres du texte initial
	initial_text.chars.each do |initial_car|
		
		#récupérer la valeur ASCII de la lettre
		initial_car_ascii = initial_car.ord
		
		#la chiffrer si elle fait partie des lettres suivantes a-zA-Z
		if (initial_car_ascii >= 65 && initial_car_ascii <= 90) || (initial_car_ascii >= 97 && initial_car_ascii <= 122)
			
			#effectuer le décalage, en gérant le débordement possible
			if (initial_car_ascii + shift > 122) || (initial_car_ascii <= 90 && initial_car_ascii + shift > 90)
				final_text << (initial_car_ascii + shift - 26).chr
			else
				final_text << (initial_car_ascii + shift).chr
			end
		else
			final_text << initial_car
		end
	end
	puts final_text
end

chiffre_de_cesar("What a string!", 5)