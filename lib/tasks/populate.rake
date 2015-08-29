namespace :populate do
  desc "Populate"
  task data: :environment do
    file = CSV.open("#{Rails.root}/public/esculturas.csv", "r", {:col_sep => "|"}) 
    file.to_a.each do |row|
      description = "Obra: #{row[1].nil? ? 'Sin Titulo' :  row[1].upcase} \n"
      description << "Direccion: #{row[7]} \n"
      description << "AÑO EMPLAZAMIENTO/INAUGURACION:"
      description << "#{row[2].nil? ? 'Sin Datos' : row[2] } \n" 
      description << "Autor: #{row[3]} \n"
      description << "Material: #{row[5]} \n"
      description << "Premios: #{row[9].nil? ? 'Sin Datos' : row[9] } \n"

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