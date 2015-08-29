 #!/usr/bin/env /home/leandro/rails-projects/rsociety/bin/rails runner
require 'telegram/bot'

token = '115314776:AAE_ytko54qrjWALCkAAb0nwTaa5EnjGLYk'

Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    binding.pry
    puts "#{message.from.first_name}: #{message.text}"
    case message.text
    when '/start'
      bot.api.sendMessage(chat_id: message.chat.id, text: "Hello, #{message.from.first_name}")
    when '/stop'
      bot.api.sendMessage(chat_id: message.chat.id, text: "Bye, #{message.from.first_name}")
    end
  end
end