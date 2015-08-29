namespace :populate do
  desc "Populate"
  task data: :environment do
    file = CSV.open("#{Rails.root}/public/esculturas.csv", "r", {:col_sep => "|"}) 
    file.to_a.each do |row|
      # binding.pry
      description = "<b>A&Ntilde:O EMPLAZAMIENTO/INAUGURACI&Oacute;N</b>"
      description << "#{row[2].nil? ? 'Sin Datos' : row[2] } <br>" 
      description << "<b>Autor <b/> #{row[3]}<br>"
      description << "<b>Material <b/> #{row[5]}<br>"
      description << "<b>Premios <b/> #{row[9].nil? ? 'Sin Datos' : row[9] }<br>"

      Art.create(
        title: row[1],
        address: row[7],
        latitude: row[8] ? row[8].split(',')[0] : nil,
        longitude: row[8] ? row[8].split(',')[1] : nil,
        description: description
      )
    end
  end
end