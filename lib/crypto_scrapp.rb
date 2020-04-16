require 'nokogiri'
require 'open-uri'

#page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))

#all_emails_links = page.xpath('/mettre_ici_le_XPath')

#base_url = "https://coinmarketcap.com/all/views/all/"

page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))

def cryptomonnaies_name
  crypto_name = []
  page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
    page.xpath('//*[@id="__next"]/div/div[2]/div[1]/div[2]/div/div[2]/div[3]/div/table/tbody/tr[1]/td[3]').each do |node|
    
    crypto_name << node.text
  end
  return crypto_name
end


puts cryptomonnaies_name


