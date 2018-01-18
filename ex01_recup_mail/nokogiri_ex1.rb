require 'rubygems'
require 'nokogiri'
require 'open-uri'

def get_the_email_of_a_townhal_from_its_webpage
	page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/95/vaureal.html"))

	email_adress = ""
	page.css("tr > td > p > font").each do |email|
		if email.text.include?"@"
			email_adress = email.text
		end
	end
	puts email_adress
end

get_the_email_of_a_townhal_from_its_webpage

