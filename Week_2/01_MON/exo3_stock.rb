def trader_du_dimanche(stocks)
	max_gain = 0
	day_buy = 1
	day_sell = 1

	for index_1 in (0..stocks.size - 2) do
		for index_2 in (index_1 + 1..stocks.size - 1) do
			gain = stocks[index_2] - stocks[index_1]
			if gain > max_gain
				max_gain = gain
				day_buy = index_1
				day_sell = index_2
			end
			index_2 += 1
		end
		index_1 += 1
	end

	puts "[#{day_buy},#{day_sell}]  # $#{stocks[day_sell]} - $#{stocks[day_buy]} == $#{max_gain}"
end

def calculate_max_gain(stocks, company)
	max_gain = 0
	day_buy = 1
	day_sell = 1

	for index_1 in (0..stocks.size - 2) do
		for index_2 in (index_1 + 1..stocks.size - 1) do
			gain = stocks[index_2][company] - stocks[index_1][company]
			if gain > max_gain
				max_gain = gain
				day_buy = index_1
				day_sell = index_2
			end
			index_2 += 1
		end
		index_1 += 1
	end

	if max_gain > 0
		puts "#{company} : achète jour #{day_buy} ($#{stocks[day_sell][company]}) - vend jour #{day_sell} ($#{stocks[day_buy][company]}) #  gain  = $#{max_gain}"
	end
end

def trader_du_lundi()

	input_company = [:GOO, :MMM, :ADBE, :EA, :BA, :KO, :XOM, :GPS, :MCD, :DIS, :CRM, :JNJ]

	input_stocks = [
		{ :GOO => 15, :MMM => 14, :ADBE => 12, :EA=> 13, :BA => 8, :KO => 10, :XOM => 20, :GPS => 7, :MCD => 11, :DIS => 15, :CRM => 6, :JNJ => 10 },
		{ :GOO => 8, :MMM => 20, :ADBE => 3, :EA=> 10, :BA => 5, :KO => 19, :XOM => 12, :GPS => 6, :MCD => 15, :DIS => 9, :CRM => 10, :JNJ => 17 },
		{ :GOO => 3, :MMM => 8, :ADBE => 15, :EA=> 5, :BA => 10, :KO => 5, :XOM => 15, :GPS => 13, :MCD => 10, :DIS => 18, :CRM => 5, :JNJ => 14 },
		{ :GOO => 17, :MMM => 3, :ADBE => 6, :EA=> 9, :BA => 15, :KO => 6, :XOM => 8, :GPS => 1, :MCD => 10, :DIS => 15, :CRM => 18, :JNJ => 3 },
		{ :GOO => 8, :MMM => 18, :ADBE => 4, :EA=> 6, :BA => 15, :KO => 18, :XOM => 3, :GPS => 12, :MCD => 19, :DIS => 3, :CRM => 7, :JNJ => 9 },
		{ :GOO => 10, :MMM => 12, :ADBE => 8, :EA=> 3, :BA => 18, :KO => 20, :XOM => 5, :GPS => 11, :MCD => 3, :DIS => 9, :CRM => 8, :JNJ => 15 },
		{ :GOO => 17, :MMM => 14, :ADBE => 2, :EA=> 17, :BA => 7, :KO => 13, :XOM => 1, :GPS => 15, :MCD => 15, :DIS => 10, :CRM => 9, :JNJ => 17 }
	]

	input_company.each do |company|
		calculate_max_gain(input_stocks, company)
	end

end

#trader_du_dimanche([17,3,6,9,15,8,6,1,10])
trader_du_lundi()