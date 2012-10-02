# encoding: utf-8

require "yaml"

Import_Dir = "#{Dir.getwd}/db/import/"

Niveles =  {
            :guarderia  => ["Guarderia", nil],
            :infantil   => ["Infantil", nil],
            :primaria   => ["Primaria", nil],
            :eso        => ["ESO", nil],
            :eso_2ciclo => ["ESO 2do ciclo", :eso],
            :eso_1ciclo => ["ESO 1er ciclo", :eso],
            :bachiller  => ["Bachiller", nil],
            :bachiller_ciencias => ["Bachiller: Ciencias y tecnologia", :bachiller],
            :bachiller_humanidades => ["Bachiller: Humanidades y ciencias sociales", :bachiller],
            :bachiller_artes_plasticas => ["Bachiller: Artes plásticas, diseño y imagen", :bachiller],
            :bachiller_artes_escenicas => ["Bachiller: Artes escénicas, música y danza", :bachiller],
            :fp         => ["Formacion Profesional", nil]
           }


def create_or_update_school(school)
  ciudad = City.find_or_create_by_name(school[:ciudad])
  saved_school = School.find_by_name_and_city_id(school[:nombre],ciudad.id)

  if saved_school
    puts "updating school #{school[:nombre]}"
    create_or_update_levels(saved_school, school[:niveles])
    saved_school.save
  else
    puts "creating school #{school[:nombre]}"
    debugger
    new_school = School.new(:name => school[:nombre])
    new_school.city = ciudad
    create_or_update_levels(new_school, school[:niveles])
    new_school.save
  end
end

def create_or_update_levels(school, levels)
  # TODO: añadir la referencia a los niveles superiores y tener cuidado de añadir primero los niveles superiores!
  levels.each do |level|
    if Niveles.has_key?(level)
      school.levels << Level.find_or_create_by_name(Niveles[level][0])
    else
      raise "#{level} key not supported!"
    end
  end
end

def import_school_file(file)
  schools=YAML.load(File.open(file))
  schools.each do |school|
    create_or_update_school(school)
  end
end

# procesar todos los archivos *.yml
def run
  Dir.entries(Import_Dir).each do |entry|
    if File.extname(entry) == ".yml"
      puts "importing #{entry}..."
      import_school_file Import_Dir + entry
    end
  end
end

run
