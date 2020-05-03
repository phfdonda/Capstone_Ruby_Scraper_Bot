# frozen_string_literal: true

require_relative '../lib/scraper.rb'
require_relative '../lib/script.rb'
require 'telegram/bot'
require 'pry'
require 

Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    case message.text
    when '/start'
      sugestao = scraper
      bot.api.send_message(chat_id: message.chat.id, text: 'Oi! Peraí, deixa eu pausar minha série aqui, só um instante...')
      bot.api.send_message(chat_id: message.chat.id, text: 'Beleza, pausei! Série boa, olha! Quer uma sugestão? Assiste essa aí!')
      bot.api.send_message(chat_id: message.chat.id, text: "O nome dela é #{sugestao[:title]}.")
      bot.api.send_message(chat_id: message.chat.id, text: "Ela foi dirigida por #{sugestao[:director]} em #{sugestao[:release]}, e tem atores bons como #{sugestao[:cast]}. Mas não sou só eu falando não!")
      bot.api.send_message(chat_id: message.chat.id, text: "Ela tem nota #{sugestao[:stars]} no site AdoroCinema, ok?")
      bot.api.send_message(chat_id: message.chat.id, text: 'Bem, quer um resumo? Lá vai:')
      bot.api.send_message(chat_id: message.chat.id, text: (sugestao[:review_text]).to_s)
      bot.api.send_message(chat_id: message.chat.id, text: 'Vale a pena dar uma checada! Assiste o primeiro episódio, vai que gosta? Bem, é isso. Vou voltar pra minha série, ok? Falou!')
    end
  end
end
