require 'rubygems'
require 'nokogiri'
require 'open-uri'


#On récuperère le nom de chaque mairie dans un tableau.
def get_townhall_url
  page = Nokogiri::HTML(URI.open("https://www.annuaire-des-mairies.com/val-d-oise.html"))
  townhall_array = []
  page.css(".lientxt").map {|name| townhall_array << name.text.downcase.capitalize!}
  return townhall_array
end
#On récupère les emails de chaques mairies.
def get_townhall_email(townhall_array)
  townhall_email_array = []
  townhall_without_space = []
  townhall_array.each {|tws| townhall_without_space << tws.gsub(" ","-").downcase}
  townhall_without_space.each do |town|
  page = Nokogiri::HTML(URI.open("https://annuaire-des-mairies.com/95/#{town}.html"))
  page.xpath("/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]").map { |email| townhall_email_array << email.text}
  end
  return townhall_email_array
end

# On assemble les deux tableaux dans un Hash.
def perform
  puts "<...Chargement en cours...>"
  townhall_hash = get_townhall_url.zip(get_townhall_email(get_townhall_url)).map { |hash| [hash].to_h}
  puts townhall_hash
end

perform