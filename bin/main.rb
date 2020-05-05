require_relative '../lib/scraper.rb'
require 'telegram/bot'
require 'yaml'
require 'pry'

token = YAML.load_file(File.join(__dir__, 'config.yaml'))[:token]

Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    case message.text
    when '/start'
      sugestao = scraper
      script = ['Oi! Peraí, deixa eu pausar minha série aqui, só um instante...',
                'Beleza, pausei! Uau, série de te prender na cadeira! Quer uma sugestão? Assiste essa aí!',
                "O nome dela é #{sugestao[:title]}.",
                "Ela foi dirigida por #{sugestao[:director]}, e tem atores bons como #{sugestao[:cast]}.",
                ' Mas não sou só eu falando não!',
                "Ela tem nota #{sugestao[:stars]} no site AdoroCinema, ok?",
                'Bem, quer um resumo? Lá vai:',
                'Vale a pena dar uma checada! Assiste o primeiro episódio, vai que gosta? Bem, é isso.',
                ' Vou voltar pra minha série, ok? Té mais']
      bot.api.send_message(chat_id: message.chat.id, text: script[0])
      bot.api.send_message(chat_id: message.chat.id, text: script[1])
      bot.api.send_message(chat_id: message.chat.id, text: script[2])
      bot.api.send_message(chat_id: message.chat.id, text: script[3] + script[4])
      bot.api.send_message(chat_id: message.chat.id, text: script[5])
      bot.api.send_message(chat_id: message.chat.id, text: script[6])
      bot.api.send_message(chat_id: message.chat.id, text: (sugestao[:review_text]).to_s)
      bot.api.send_message(chat_id: message.chat.id, text: script[7] + script[8])
    else
      script2 = ['Foi mal, o quê? Tô concentrado aqui.', 'Se precisar de outra indicação, manda um /start']
      bot.api.send_message(chat_id: message.chat.id, text: script2[0] + script2[1])
    end
  end
end
