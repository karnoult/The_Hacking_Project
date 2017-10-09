def trader_du_dimanche()
	mon_input = [17,3,6,9,15,8,6,1,10]

	max_gain = 0
	day_buy = 1
	day_sell = 1

	for index_1 in (0..mon_input.size - 2) do
		for index_2 in (index_1 + 1..mon_input.size - 1) do
			gain = mon_input[index_2] - mon_input[index_1]
			if gain > max_gain
				max_gain = gain
				day_buy = index_1
				day_sell = index_2
			end
			index_2 += 1
		end
		index_1 += 1
	end

	puts "[#{day_buy},#{day_sell}]  # $#{mon_input[day_sell]} - $#{mon_input[day_buy]} == $#{max_gain}"
end

trader_du_dimanche()
