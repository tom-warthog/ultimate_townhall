require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pry'

class Scrapper

  def initialize
    @info = []
    @root = "http://annuaire-des-mairies.com"
    @departements = ["haute-corse"]
  end

  def get_email(doc)
  	doc.xpath('html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text
  end

  def get_department(doc)
  	doc.xpath('/html/body/div/main/section[4]/div/table/tbody/tr[1]/td[2]').text
  end

  def get_departements_informations(page_url)
    Nokogiri::HTML(open(page_url)).xpath('//td/p/a').map do |node|
      url = node.attribute('href').value.sub(/^[.]/, @root)
      doc = Nokogiri::HTML(open(url))
      @info << { 'ville' => node.text, 'email' => get_email(doc), 'departement' => get_department(doc) }
    end
  end


  def list_all
    @departements.map do |departement|
      url = "#{@root}/#{departement}.html"
      get_departements_informations(url)
    end.flatten
  end

  def perform
    list_all
    return @info
  end

end
