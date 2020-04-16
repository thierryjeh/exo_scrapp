# Exercice THP liste des députés 
require 'pry'
require 'nokogiri'
require 'open-uri'


def email_scrapp (urldeputy)
  page = Nokogiri::HTML(open(urldeputy))
  email = page.xpath('//*[@id="b1"]/ul[2]/li[1]/ul/li/a').text

  nom = page.css('h1').text
  print nom + " : "
  puts email

end

def url_scrapp()
  #url = "http://www.nosdeputes.fr/" + prenom + "-" + nom
  doc = Nokogiri::HTML(open("https://www.nosdeputes.fr/deputes"))
  div_classes = doc.xpath('//div[@class="list_table"]')
  all_a = div_classes.css('a')   

  all_url = all_a.map{|element| urls = 'https://nosdeputes.fr'+element["href"]}

   #puts all_url

  puts all_url.each { |url| puts email_scrapp(url) }

end

url_scrapp
