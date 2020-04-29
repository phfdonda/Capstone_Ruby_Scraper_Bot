# frozen_string_literal: true

  require 'nokogiri'
  require 'httparty'
  require 'byebug'

  

  def scraper
    url = 'http://www.adorocinema.com/series-tv/top/'
    unparsed_page = HTTParty.get(url)
    parsed_page = Nokogiri::HTML(unparsed_page)
    byebug
  end

  scraper