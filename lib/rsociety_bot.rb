 #!/usr/bin/env /home/leandro/rails-projects/rsociety/bin/rails runner
require 'telegram/bot'

class RsocietyBot
  attr :message, :result, :picture
  def initialize(message)
    @message = message
    @picture = nil
    # @bot = bot
  end
  
  def get_result
    begin
      
      if @message.location
        art = art_nearst(@message.location)
        @picture = "#{Rails.root}/public#{art.photo.image.url}" unless art.photo.nil? 
        "#{art.description} Distancia: #{to_mts(distance_between(art, @message.location))} mts."
      elsif @message.text == '/start'
        "Bienvenido #{@message.from.first_name} a tu guia ArteBot"
      elsif @message.text == '/arte_cerca'
        "Envianos tu ubicacion"
      end
    rescue Exception => e
      "No puedo contestar eso"
    end
      
  end

  def get_picture
    @picture.split('?')[0] if @picture
  end

  def art_nearst(location)
    begin
      Art.near([location.latitude, location.longitude ]).first
      
    rescue Exception => e
      nil
    end
  end

  private
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
    begin
      
    msg = RsocietyBot.new(message)
    text = msg.get_result
    if msg.get_picture
      bot.api.sendPhoto(chat_id: message.chat.id, photo: File.new(msg.get_picture))
    end
    bot.api.sendMessage(chat_id: message.chat.id, text: text)
   
    rescue Exception => e
      
      bot.api.sendMessage(chat_id: message.chat.id, text: "No puedo contestar eso.")
    end
  end
end
