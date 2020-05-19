require_relative '../lib/scraper.rb'
require 'telegram/bot'
require 'yaml'
require 'pry'

def sugestion
  sugestao = scraper
  script = ['Oi! Peraí, deixa eu pausar minha série aqui, só um instante...',
            'Beleza, pausei! Uau, série de te prender na cadeira! Quer uma sugestão? Assiste essa aí!',
            "O nome dela é #{sugestao[:title]}.",
            "Ela foi dirigida por #{sugestao[:director]}, e tem atores bons como #{sugestao[:cast]}.",
            ' Mas não sou só eu falando não! ',
            "Ela tem nota #{sugestao[:stars]} no site AdoroCinema, ok?",
            "Bem, quer um resumo? Lá vai: \n",
            (sugestao[:review_text]).to_s,
            'Vale a pena dar uma checada! Assiste o primeiro episódio, vai que gosta? Bem, é isso.',
            ' Vou voltar pra minha série, ok? Té mais']
  script
end

option = ''

until %w[1 2].include?(option)
  system 'clear'
  puts 'Do you want to start the program as a Telegram bot or a Terminal bot?'.center(120, ' ')
  puts
  puts 'Press 1 for Telegram or 2 for Terminal.'.center(120, ' ')
  option = gets.chomp.strip
  puts 'Please read carefully the options and choose only 1 or 2' unless %w[telegram 1 terminal 2].include?(option)
end

case option
when '1'
  puts
  puts 'Initiating Telegram_Botflix server'.center(120, '.')
  puts
  puts 'Send /start to @botflixbot in Telegram to receive the suggestions'.center(120, ' ')
  token = YAML.load_file(File.join(__dir__, 'config.yaml'))[:token]

  Telegram::Bot::Client.run(token) do |bot|
    bot.listen do |message|
      case message.text
      when '/start'
        script = sugestion
        bot.api.send_message(chat_id: message.chat.id, text: script[0])
        bot.api.send_message(chat_id: message.chat.id, text: script[1])
        bot.api.send_message(chat_id: message.chat.id, text: script[2])
        bot.api.send_message(chat_id: message.chat.id, text: script[3] + script[4] + script[5])
        bot.api.send_message(chat_id: message.chat.id, text: script[6] + script[7])
        bot.api.send_message(chat_id: message.chat.id, text: script[8] + script[9])
      else
        script2 = ['Foi mal, falou comigo? Tô concentrado aqui.', 'Se precisar de outra indicação, manda um /start']
        bot.api.send_message(chat_id: message.chat.id, text: script2[0] + script2[1])
      end
    end
  end
when '2'
  puts
  puts 'Initiating Terminal_Botflix'.center(120, '.')
  sleep(0.8)
  puts
  another = ''
  until another == 'n'
    sugestao = sugestion
    puts
    sugestao.each { |x| puts x.center(120, ' ') }
    puts
    puts 'Gostou da idéia? Quer outra sugestão?'.center(120, ' ')
    puts
    puts 'Digite s pra Sim ou n pra Não'.center(120, ' ')
    another = gets.chomp.strip.downcase
    until %w[s n].include?(another)
      puts
      puts "Olha, é 's' pra 'SIM' ou 'n' pra 'NÃO'.".center(120, ' ')
      puts
      another = gets.chomp.strip.downcase
    end
    puts 'Ok, boa série! Até!'.center(120, ' ')
    puts
    puts 'Ending Terminal_Botflix'.center(120, '.')
    puts
    puts 'Have a great day! =)'.center(120, ' ')
    puts
    puts

  end
end
