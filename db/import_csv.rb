# encoding: utf-8
require 'csv'

# row[1] -> descripción tipo
# row[3] -> nombre
# row[9] -> ciudad

fichero = CSV.read("centros.csv", encoding: "UTF-8")
tipos = Hash.new
ciudades = Hash.new
tipos = {"PRIMARIA" => :primaria, "PRIMÀRIA" => :primaria,
         "SECUNDARIA" => :secundaria, "SECUNDÀRIA" => :secundaria,
         "INFANTIL" => :infantil,
         "ADULTES" => :adultos, "ADULTAS" => :adultos,
         "ESPECIAL" => :especial,
         "PROFESSIONAL" => :fp, "PROFESIONAL" => :fp, "AGRARIA" => :fp,
         "ESTRANGER" => :estranjero, "EXTRANJERO" => :estranjero,
         "MÚSICA" => :musica,
         "DANSA" => :danza,
         "DISSENY" => :artes_plasticas, "DISEÑO" => :artes_plasticas,
         "IDIOMES" => :eoi,
         "ESCOLA LLAR" => :escuela_hogar,
         "ESPORTIUS" => :deporte,
         "RURAL" => :colegio_rural,
         "PARVULARIO" => :preescolar, "PÀRVULS" => :preescolar, "PREESCOLAR" => :preescolar}




fichero.each do |row|
  # clasificar por ciudades
  ciudades[row[9]] ||= []

  # clasificar tipo
  tipos_centro = []
  tipos.keys.each do |key|
    if row[1].include? key
      tipos_centro << tipos[key]
    end 
  end
     
  ciudades[row[9]] << [row[3],tipos_centro]
  puts "#{tipos_centro} CENTRO:#{row[3]}, DESC:#{row[1]} "
end
