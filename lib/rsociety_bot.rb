 #!/usr/bin/env /home/leandro/rails-projects/rsociety/bin/rails runner
require 'telegram/bot'

class RsocietyBot
  attr :message, :result
  def initialize(message)
    @message = message
    # @bot = bot
  end
  
  def get_result
    if @message.location
      art = art_nearst(@message.location)
      "#{art.description} Distancia: #{to_mts(distance_between(art, @message.location))} mts."
    elsif @message.text == '/start'
      "Bienvenido #{@message.from.first_name} a tu guia ArteBot"
    elsif @message.text == '/arte_cerca'
      "Envianos tu ubicacion"
    end
      
  end

  def art_nearst(location)
    Art.near([location.latitude, location.longitude ]).first
  end

  def distance_between(art, location)
    art.distance_from([location.latitude, location.longitude ]) * 1.60934 
  end

  def to_mts(kilometros)
    (kilometros * 1000).round(2)
  end
  
end
  


token = '115314776:AAE_ytko54qrjWALCkAAb0nwTaa5EnjGLYk'

Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    bot.api.sendMessage(chat_id: message.chat.id, text: RsocietyBot.new(message).get_result)
    
   
    # when '/stop'
    #   bot.api.sendMessage(chat_id: message.chat.id, text: "Adios, #{message.from.first_name}")
    # end
  end
end
