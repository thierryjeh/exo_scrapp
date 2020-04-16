

require 'nokogiri'   
require 'open-uri'
require 'pry'


def email_of_a_townhal(urls)
  cities = []
  urls.each do |url|
    hash = {}
    doc = Nokogiri::HTML(open("http://annuaire-des-mairies.com/#{url[1..-1]}")) 
      hash[:name] = doc.xpath('/html/body/div/main/section[1]/div/div/div/h1').text 
      hash[:email] =  doc.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text
      cities << hash
    end
  return cities
end

# Métode permettant d'extraire toutes les urls des mairies du 95 et de récuperer le lien href
def urls_val_doise_townhalls
  links = []
    doc = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
    doc.xpath('//a[@class ="lientxt"]').each do |node|
    links << node['href']
  end
  return links
end


def perform
 puts list_final = email_of_a_townhal(urls_val_doise_townhalls)
  fname = "mayors_scrapp.txt" #stockage des données dans un fichier text
  somefile = File.open(fname,"w")
  somefile.puts(list_final) 
  somefile.close
end

perform



