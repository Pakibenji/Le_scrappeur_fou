require 'rubygems'
require 'nokogiri'
require 'open-uri'

url = Nokogiri::HTML(URI.open("http://www2.assemblee-nationale.fr/deputes/liste/alphabetique"))


def get_depute_url(url)
  url2 = "https://www.assemblee-nationale.fr/dyn/deputes/"
  depute_list = url.xpath('//a[contains(@href,"/deputes/fiche")]')
  depute_url_array = []
  depute_list.map { |name| depute_url_array << url2 + name.to_s[/\_(.*?)"/,1]}
  return depute_url_array
end


def get_depute_email(depute_url_array)
  depute_email_array = []
  depute_url_array.each do |mail|
  url_mail = Nokogiri::HTML(URI.open(mail))
  depute_email_array << url_mail.xpath("/html/body/div[1]/main/div/div/div/section[2]/div/ul/li[1]/a/span[2]").text
  return depute_email_array
  end
  
end

def get_depute_name(url)
  url2 = "https://www.assemblee-nationale.fr/dyn/deputes/"
  depute_list = url.xpath('//a[contains(@href,"/deputes/fiche")]')
  depute_name_array = []
  depute_list.map { |name| depute_name_array << name.text.delete_prefix("M.").delete_prefix("Mme").split}
  return depute_name_array
end
depute_url_array = get_depute_url(url)
depute_email = get_depute_email(depute_url_array)
print depute_array


  