require 'rubygems' 
require 'nokogiri'
require 'open-uri'

def get_the_email_of_a_townhal_from_its_webpage(url)
	page = Nokogiri::HTML(open(url))

	@email_adress = ""
	page.css("tr > td > p > font").each do |email|
		if email.text.include?"@"
			@array_link << email.text
		end
	end
	puts @array_link
end

def get_all_the_urls_of_val_doise_townhalls
	page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
	@array_link = []
	list_url = page.css("a.lientxt")
	list_url.each do |url|
		good_link = "http://annuaire-des-mairies.com" + url['href'][1..url['href'].length]
		get_the_email_of_a_townhal_from_its_webpage(good_link)
		@array_link << good_link
	end
	return @array_link
end
puts get_all_the_urls_of_val_doise_townhalls