# frozen_string_literal: true

require 'nokogiri'
require 'httparty'
require 'byebug'

def scraper
  url = 'http://www.adorocinema.com/series-tv/top/'
  unparsed_page = HTTParty.get(url)
  parsed_page = Nokogiri::HTML(unparsed_page)
  articles = parsed_page.css('li.mdl')
  articles.each do |article|
    review = {
      title: article.css('a.meta-title-link').text,
      release: article.css('div.meta-body-info').text.gsub("\n", '').gsub('  ', '').split('/')[0],
      duration: article.css('div.meta-body-info').text.gsub("\n", '').gsub('  ', '').split('/')[1],
      genre: article.css('div.meta-body-info').text.gsub("\n", '').gsub('  ', '').split('/')[2],
      director: article.css('div.meta-body-direction').text.gsub('  ', '').gsub("\n", '').gsub('Direção:', ''),
      cast: article.css('div.meta-body-actor').text.gsub('  ', '').gsub("\n", '').gsub('Elenco:', ''),
      review: article.css('div.content-txt').text,
      stars: article.css('span.stareval-note').text
    }
    byebug
  end
end

scraper
