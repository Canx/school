# encoding: utf-8
require 'csv'

# row[1] -> descripción tipo
# row[3] -> nombre
# row[9] -> ciudad

fichero = CSV.read("db/centros.csv", encoding: "UTF-8")
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

levels = { :infantil => "Infantil",
           :primaria => "Primaria",
           :secundaria => "Secundaria",
           :adultos => "Adultos",
           :eoi => "E.O.I.",
           :especial => "Educación Especial",
           :preescolar => "Preescolar",
           :fp => "Formación Profesional",
           :artes_plasticas => "Artes Plásticas",
           :musica => "Música",
           :danza => "Danza",
           :deporte => "Escuela deportiva",
           :colegio_rural => "Colegio rural",
           :estranjero => "Centro estranjero",
           :escuela_hogar => "Escuela hogar"}

levels.each do |symbol,level|
  Level.find_or_create_by_name(level)
end

fichero.each do |row|
  # Crear centro
  school = School.new(:name => row[3]) 

  # Crear ciudad
  ciudad = City.find_or_create_by_name(row[9])

  school.city = ciudad

  tipos.keys.each do |key|
    if row[1].include? key
      school.levels << Level.find_by_name(levels[tipos[key]])
    end 
  end
     
  puts "CENTRO:#{row[3]}, DESC:#{row[1]} "
  school.save!
end
