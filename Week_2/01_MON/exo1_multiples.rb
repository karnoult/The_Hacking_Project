def h(max_value = 0)
	sum_multiples = 0
	max_value.times do |i|
		sum_multiples += i if i%3 == 0 || i%5 == 0
	end
	puts "Somme des multiples de 3 et 5 inférieurs à #{max_value} = #{sum_multiples}"
end

h(1000)
