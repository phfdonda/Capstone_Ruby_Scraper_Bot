# spec/scraper_spec.rb
require_relative '../lib/scraper.rb'

describe '#scraper' do
  it 'Should return a Hash containing a suggestion with info of a series to watch' do
    expect(scraper).to be_kind_of(Hash)
  end
end
