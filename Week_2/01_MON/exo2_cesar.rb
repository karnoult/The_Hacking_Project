def chiffre_de_cesar(initial_text, shift)
	final_text = ""

	#recalculer le décalage pour qu'il reste inférieur à 26
	shift = shift % 26

	#passer sur toutes les lettres du texte initial
	initial_text.chars.each do |initial_car|
		
		#récupérer la valeur ASCII de la lettre
		initial_car_ascii = initial_car.ord

		#la chiffrer si elle fait partie des lettres suivantes a-zA-Z
		if (initial_car_ascii >= "A".ord && initial_car_ascii <= "Z".ord) || (initial_car_ascii >= "a".ord && initial_car_ascii <= "z".ord)
			
			#effectuer le décalage, en gérant le débordement possible
			if (initial_car_ascii + shift > "z".ord) || (initial_car_ascii <= "Z".ord && initial_car_ascii + shift > "Z".ord)
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
