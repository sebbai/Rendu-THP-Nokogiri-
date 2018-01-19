require 'rubygems' 
require 'nokogiri'
require 'open-uri'

def crypto_currency

	page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
	stock_prices = page.xpath('//td[5]/a')
	currency = page.xpath('//td[2]/a')
	array_stock_prices = []
	boucle_infini = 0
	while (boucle_infini < 20)
		hash_stock = Hash.new
		stock_prices[0..1500].each do |temp| # <= grandes boucles pour récuperer le plus grand nombre de nonnaie.
		hash_stock[currency[stock_prices.index(temp)].text] = temp.text
		array_stock_prices << hash_stock
		end

		i = array_stock_prices.length
		puts array_stock_prices[i - 1]
		sleep(3600) # <= timer sur 3600 seconde(1 heure)
		puts " "
		puts " "
		puts " "
		puts "===============================================++++++++++++++===================================================="
		puts " "
	    puts " "
		puts " "

	end

end
puts crypto_currency