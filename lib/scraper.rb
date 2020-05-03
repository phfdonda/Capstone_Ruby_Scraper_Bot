# frozen_string_literal: true

require 'nokogiri'
require 'httparty'
require 'byebug'

def scraper
  url = 'http://www.adorocinema.com/series-tv/top/'
  unparsed_page = HTTParty.get(url)
  parsed_page = Nokogiri::HTML(unparsed_page)
  articles = parsed_page.css('li.mdl')
  review_count = 0
  reviews = []
  while review_count < 100
    articles.each do |article|
      review = {
        title: article.css('a.meta-title-link').text,
        release: article.css('div.meta-body-info').text.gsub("\n", '').gsub('  ', '').gsub('Desde ', '').split('/')[0],
        duration: article.css('div.meta-body-info').text.gsub("\n", '').gsub('  ', '').split('/')[1],
        genre: article.css('div.meta-body-info').text.gsub("\n", '').gsub('  ', '').split('/')[2],
        director: article.css('div.meta-body-direction').text.gsub('  ', '').gsub("\n", '').gsub('Direção:', ''),
        cast: article.css('div.meta-body-actor').text.gsub('  ', '').gsub("\n", '').gsub('Elenco:', ''),
        review_text: article.css('div.content-txt').text.gsub('  ', '').gsub("\n", ''),
        stars: article.css('span.stareval-note').text.gsub('--', '').gsub(',', '.').to_f
      }
      reviews << review && review_count += 1 if review[:stars] > 4.2
      break if reviews.count == 100
    end
  end
  reviews[rand(0...100)]
  end

scraper
