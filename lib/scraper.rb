require 'nokogiri'
require 'http'

def scraper
  articles = Nokogiri::HTML(HTTP.get('http://www.adorocinema.com/series-tv/top/').to_s).css('li.mdl')
  reviews = []
  while reviews.count < 100
    articles.each do |article|
      review = {
        title: article.css('a.meta-title-link').text,
        duration: article.css('div.meta-body-info').text.gsub("\n", '').gsub('  ', '').split('/')[1],
        genre: article.css('div.meta-body-info').text.gsub("\n", '').gsub('  ', '').split('/')[2],
        director: article.css('div.meta-body-direction').text.gsub('  ', '').gsub("\n", '').gsub('Direção:', ''),
        cast: article.css('div.meta-body-actor').text.gsub('  ', '').gsub("\n", '').gsub('Elenco:', ''),
        review_text: article.css('div.content-txt').text.gsub('  ', '').gsub("\n", ''),
        stars: article.css('span.stareval-note').text.gsub('--', '').gsub(',', '.').to_f
      }
      reviews << review if review[:stars] > 4.2
      break if reviews.count == 100
    end
  end
  reviews[rand(0...100)]
end

scraper
