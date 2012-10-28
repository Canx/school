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
            :especial   => ["Educación Especial", nil],
            :bachiller  => ["Bachiller", nil],
            :adultos    => ["Adultos", nil],
            :bachiller_ciencias => ["Bachiller: Ciencias y tecnologia", :bachiller],
            :bachiller_humanidades => ["Bachiller: Humanidades y ciencias sociales", :bachiller],
            :bachiller_artes_plasticas => ["Bachiller: Artes plásticas, diseño y imagen", :bachiller],
            :bachiller_artes_escenicas => ["Bachiller: Artes escénicas, música y danza", :bachiller],
            :bachiller_internacional => ["Bachiller internacional", :bachiller],
            :fp         => ["Formacion Profesional", nil],
            :fp_ciclo_gestion_administrativa => ["Gestión administrativa", :fp],
            :fp_ciclo_video_disc_jockey => ["Video DJ i sonido", :fp],
            :fp_ciclo_SMR => ["SISTEMES MICROINFORMÀTICS I XARXES", :fp],
            :fp_ciclo_atencion_dependencia => ["ATENCIÓ A PERSONES EN SITUACIÓ DE DEPENDÈNCIA", :fp],
            :fp_ciclo_comercio => ["COMERÇ", :fp],
            :fp_ciclo_fisico_natural => ["CONDUCCIÓ ACTIVITATS FÍSICO-ESPORTIVES EN EL MEDI NATURAL", :fp],
            :fp_ciclo_instalaciones_electricas => ["INSTAL·LACIONS ELÈCTRIQUES I AUTOMÀTIQUES", :fp],
            :fp_ciclo_artista_faller => ["ARTISTA FALLER I CONSTRUCCIÓ D'ESCENOGRAFIES", :fp],
            :fp_ciclo_obra_civil => ["POJECTES D'OBRA CIVIL", :fp],
            :fp_ciclo_laboratorio => ["LABORATORI", :fp],
            :fp_ciclo_edificacion => ["PROJECTES D'EDIFICACIÓ", :fp],
            :fp_ciclo_mant_electromec => ["MANTENIMENT ELECTROMECÀNIC",:fp],
            :fp_ciclo_inst_teleco => ["INSTAL·LACIONS DE TELECOMUNICACIONS", :fp],
            :fp_ciclo_forestales => ["TREBALLS FORESTALS I DE CONSERVACIÓ DEL MEDI NATURAL", :fp],
            :fp_ciclo_peluqueria => ["PERRUQUERIA I COSMÈTICA CAPIL·LAR", :fp],
            :fp_ciclo_moda => ["PATRONAJE I MODA", :fp],
            :fp_ciclo_enfermeria => ["CURES AUXILIARES D'INFERMERIA", :fp],
            :fp_ciclo_renovables => ["ENERGIES RENOVABLES", :fp],
            :fp_ciclo_agropec => ["GESTIÓ I ORGANITZACIÓ D'EMPRESES AGROPECUARIES", :fp],
            :fp_ciclo_social => ["INTEGRACIÓ SOCIAL", :fp],
            :fp_ciclo_cocina => ["CUINA I GASTRONOMIA", :fp],
            :fp_ciclo_secretaria => ["SECRETARIAT", :fp],
            :fp_ciclo_lab_imagen => ["LABORATORI D'IMATGE", :fp],
            :fp_ciclo_restauracion => ["SERVICIS DE RESTAURACIÓ", :fp],
            :fp_ciclo_climatizacion => ["INSTAL·LACIONS FRIGORIFÍQUES I DE CLIMATITZACIÓ", :fp],
            :fp_ciclo_jardineria => ["JARDINERIA I FLORISTERIA", :fp],
            :fp_ciclo_infantil => ["EDUCACIÓ INFANTIL", :fp],
            :fp_ciclo_robotica => ["AUTOMATITZACIÓ I ROBÒTICA INDUSTRIAL", :fp],
            :fp_ciclo_animacion_turistica => ["ANIMACIÓ TURÍSTICA", :fp],
            :fp_ciclo_DAI => ["DESENROTLLAMENT D'APLICACIONS INFORMÀTIQUES", :fp],
            :fp_ciclo_animacion_fisica => ["ANIMACIÓ D'ACTIVITATS FÍSIQUES I ESPORTIVES", :fp],
            :fp_ciclo_finanzas => ["ADMINISTRACIÓ I FINANCES", :fp],
            :fp_ciclo_impresion => ["IMPRESSIÓ EN ARTS GRÀFIQUES", :fp],
            :fp_ciclo_viajes => ["AGÈNCIES DE VIATGES I GESTIÓ D'ESDEVENIMENTS", :fp],
            :fp_ciclo_signos => ["INTERPRETACIÓ DE LA LLENGUA DE SIGNES", :fp],
            :fp_ciclo_estetica => ["ESTÈTICA PERSONAL I DECORATIVA", :fp],
            :fp_ciclo_farmacia => ["FARMÀCIA I PARAFARMÀCIA", :fp],
            :fp_ciclo_marina => ["OPERACIÓ, CONTROL I MANT. MÀQUINES MARINES I INSTAL. VAIXELL", :fp],
            :fp_ciclo_obras_interior => ["OBRES D'INTERIOR, DECORACIÓ I REHABILITACIÓ", :fp],
            :fp_ciclo_direccion_cocina => ["DIRECCIÓ DE CUINA", :fp],
            :fp_ciclo_pasteleria => ["FORN, REBOSTERIA I CONFITERIA", :fp],
            :fp_ciclo_dentista => ["PRÓTESI DENTALS", :fp],
            :fp_ciclo_mecanizado => ["MECANITZAT", :fp],
            :fp_ciclo_agroecologia => ["PRODUCCIÓ AGROECOLÒGICA", :fp],
            :fp_ciclo_eficiencia => ["EFICIÈNCIA ENERGÈTICA I ENERGIA SOLAR TÈRMICA", :fp],
            :fp_ciclo_calor => ["INSTAL·LACIONS DE PRODUCCIÓ DE CALOR", :fp],
            :fp_ciclo_DAM => ["DESENVOLUPAMENT D'APLICACIONS MULTIPLATAFORMA", :fp],
            :fp_ciclo_audiovisual => ["REALITZACIÓ DE PROJECTES D'AUDIOVISUALS I ESPECTACLES", :fp],
            :fp_ciclo_emergencias_sanitarias => ["EMERGÈNCIES SANITÀRIES", :fp],
            :fp_ciclo_estetica_integral => ["ESTÈTICA INTEGRAL I BENESTAR", :fp],
            :fp_ciclo_ASIR => ["ADMINISTRACIÓ DE SISTEMES INFORMÀTICS EN XARXA", :fp],
            :fp_ciclo_imagen_diagnostico => ["IMATGE PER AL DIAGNÓSTIC", :fp],
            :fp_ciclo_logistica => ["TRANSPORT I LOGÍSTICA", :fp],
            :fp_ciclo_produccion_agropecuaria => ["PRODUCCIÓ AGROPECUÀRIA", :fp],
            :fp_ciclo_muebles => ["INSTAL·LACIÓ I MOBLAMENT", :fp],
            :fp_ciclo_comercio_internacional => ["COMERÇ INTERNACIONAL", :fp],
            :fp_ciclo_construccion => ["CONSTRUCCIÓ", :fp],
            :fp_ciclo_comercial_marketing => ["GESTIÓ COMERCIAL I MÀRQUETING", :fp],
            :fp_ciclo_sistemas_electrotecnicos => ["SISTEMES ELECTROTÈCNICS I AUTOMATITZATS", :fp],
            :fp_ciclo_soldadura => ["SOLDADURA I CALDERERIA", :fp],
            :fp_ciclo_buceo => ["BUSSEIG A MITJA PROFUNDITAT", :fp],
            :fp_ciclo_animacion_sociocultural => ["ANIMACIÓ SOCIOCULTURAL", :fp],
            :fp_ciclo_lab_clinico => ["LABORATORI DE DIAGNOSTIC CLÍNIC", :fp],
            :fp_ciclo_mant_termiques => ["MANTENIMENT D'INSTAL·LACIONS TÈRMIQUES I DE FLUIDS", :fp],
            :fp_ciclo_electro_auto => ["ELECTROMECÀNICA DE VEHICLES AUTOMÒBILS", :fp],
            :fp_ciclo_carroceria => ["CARROSSERIA", :fp],
            :fp_ciclo_automocion => ["AUTOMOCIÓ", :fp],
            :fp_ciclo_pesca => ["PESCA I TRANSPORT MARÍTIM", :fp],
            :fp_ciclo_maquinas_marinas => ["SUPERVISIÓ I CONTROL DE MÀQUINES MARINES I INSTAL·LACIÓ VAIXELL", :fp],
            :fp_ciclo_transporte_maritimo => ["TRANSPORT MARÍTIM I PESCA D'ALTURA", :fp],
            :fp_ciclo_sistemas_teleco => ["SISTEMES DE TELECOMUNICACIONS I INFORMÀTICS", :fp],
            :fp_ciclo_mant_electro => ["MANTENIMENT ELECTRÒNIC", :fp],
            :fp_ciclo_produccion_mecanica => ["PROGRAMACIÓ DE LA PRODUCCIÓ EN FABRICACIÓ MECÀNICA", :fp],
            :fp_ciclo_mecatronica_industrial => ["MECATRÓNICA INDUSTRIAL", :fp],
            :fp_ciclo_caracterizacion => ["CARACTERITZACIÓ", :fp],
            :fp_ciclo_asesoria_imagen => ["ASSESSORIA D'IMATGE PERSONAL", :fp],
            :fp_ciclo_servicios_consumidor => ["SERVICIS AL CONSUMIDOR", :fp],
            :fp_ciclo_planes_obra => ["REALITZACIÓ I PLANS D'OBRA", :fp],
            :fp_ciclo_citologia => ["ANATOMIA PATÓLOGICA-CITÓLOGIA", :fp],
            :fp_ciclo_higiene_bucodental => ["HIGIENE BUCODENTAL", :fp],
            :fp_ciclo_DAW => ["DESENVOLUPAMENT D'APLICACIONS WEB", :fp],
            :fp_ciclo_restauracion => ["DIRECCIÓ DE SERVICIS DE RESTAURACIÓ", :fp],
            :fp_ciclo_guia_turistico => ["GUIA, INFORMACIÓ I ASSISTÈNCIA TURÍSTIQUES", :fp],
            :fp_ciclo_gestion_turistica => ["GESTIÓ D'ALLOTJAMENTS TURÍSTICS", :fp],
            :fp_ciclo_procesos_alimentos => ["PROCESSOS I QUALITAT EN LA INDÚSTRIA ALIMENTÀRIA", :fp],
            :fp_ciclo_quimica_ambiental => ["QUÍMICA AMBIENTAL", :fp],
            :fp_ciclo_control_calidad => ["LABORATORI D'ANÀLISI I DE CONTROL DE QUALITAT", :fp],
            :fp_ciclo_electronica_consumo => ["EQUIPS ELECTRÓNICS DE CONSUM", :fp],
            :fp_ciclo_servicios_restauracion => ["SERVICIS DE RESTAURACIÓ", :fp],
            :fp_ciclo_salud_ambiental => ["SALUT AMBIENTAL", :fp],
            :fp_ciclo_mueble => ["FUSTERIA I MOBLE", :fp],
            :fp_ciclo_retoque_fotografico => ["IL·LUMINACIÓ, CAPTACIÓ I TRACTAMENT D'IMATGE", :fp],
            :fp_ciclo_sonido_espectaculos => ["SO PER A AUDIOVISUALS I ESPECTACLES", :fp],
            :fp_ciclo_mant_frio_calor => ["MUNTATGE I MANTENIMENT INSTAL·LACIONS FRED,CLIMATITZACIÓ I PRODUCCIO DE CALOR", :fp],
            :fp_ciclo_prevencion_riesgos => ["PREVENCIÓ DE RISCOS PROFESSIONALS", :fp],
            :fp_ciclo_preimpresion_digital => ["PREIMPRESSIÓ DIGITAL", :fp],
            :fp_ciclo_proyectos_termicos => ["DESENVOLUPAMENT DE PROJECTES D'INSTAL·LACIONS TÈRMIQUES I DE FLUIDS", :fp],
            :fp_ciclo_produccion_audiovisuales => ["PRODUCCIÓN DE AUDIOVISUALES Y ESPECTÁCULOS", :fp],
            :fp_ciclo_dietetica => ["DIETÈTICA", :fp],
            :fp_ciclo_ceramica => ["DESENVOLUPAMENT I FABRICACIÓ DE PRODUCTES CERÀMICS", :fp],
            :fp_ciclo_documentacion_sanitaria => ["DOCUMENTACIÓ SANITARIA", :fp],
            :fp_ciclo_confeccion_moda => ["CONFECCIÓ I MODA", :fp],
            :fp_ciclo_disenyo_mueble => ["DISSENY I MOBLAMENT", :fp],
            :fp_ciclo_gestion_forestal => ["GESTIÓ FORESTAL I DEL MEDI NATURAL", :fp],
            :fp_ciclo_mant_aeromecanico => ["MANTENIMENT AEROMECÀNIC", :fp],
            :fp_ciclo_mant_avionica => ["MANTENIMENT D'AVIÓNICA", :fp],
            :fp_ciclo_disenyo_calzado => ["DISSENY I PRODUCCIÓ DE CALÇAT I COMPLEMENTS", :fp],
            :fp_ciclo_disenyo_produccion_editorial => ["DISSENY I PRODUCCIÓ EDITORIAL", :fp],
            :fp_ciclo_transf_plasticos_caucho => ["OPERACIONS DE TRANSFORMACIÓ DE PLÀSTICS I CAUTXU", :fp],
            :fp_ciclo_plasticos_caucho => ["PLÀSTICS I CAUTXU", :fp],
            :fp_ciclo_optica => ["ÓPTICA I PROTETICA OCULAR", :fp],
            :fp_ciclo_joyeria => ["JOIERIA", :fp],
            :fp_ciclo_disenyo_fab_mecanica => ["DISSENY EN FABRICACIÓ MECÀNICA", :fp],
            :fp_ciclo_ortoprotesica => ["ORTOPROTÈSICA", :fp],
            :fp_ciclo_fab_productos_ceramicos => ["FABRICACIÓ DE PRODUCTES CERÀMICS", :fp],
            :fp_ciclo_radioterapia => ["RADIOTERÀPIA", :fp],
            :fp_ciclo_aceites_vinos => ["OLIS D'OLIVA I VINS", :fp],
            :fp_ciclo_vitivinicultura => ["VITIVINICULTURA", :fp],
            :fp_ciclo_tratamientos_superf_termicos => ["TRACTAMENTS SUPERFICIALS I TÈRMICS", :fp],
            :fp_ciclo_construcciones_metalicas => ["CONSTRUCCIONS METÀL·LIQUES", :fp],
            :fp_ciclo_audiologia_protesica => ["AUDIOLOGÍA PROTÈSICA", :fp],
            :fp_ciclo_produccion_indust_grafica => ["PRODUCCIÓ EN INDUSTRIES D'ARTS GRÀFIQUES", :fp],
            :fp_ciclo_instal_electrotecnicas => ["INSTAL·LACIONS ELECTROTÈCNIQUES", :fp],
            :fp_ciclo_proyectos_construccion => ["DESENVOLUPAMENT I APLICACIÓ DE PROJECTES DE CONSTRUCCIÓ", :fp]

         }


def create_or_update_school(school)
  current_school = School.find_by_code(school[:codigo])

  if current_school.nil? then
    puts "creating school #{school[:nombre]}"
    current_school = School.new
  else
    puts "updating school #{school[:nombre]}"
  end

  update_school_fields(current_school, school)
  current_school.save!
end

def update_school_fields(new_school, school)
  new_school.code = school[:codigo]
  new_school.name = school[:nombre]
  new_school.city = City.find_or_create_by_name(school[:ciudad])
  new_school.levels = find_or_create_levels(new_school, school[:niveles])
  new_school.phone = school[:telefono]
  new_school.address = school[:direccion]
end

def find_or_create_level(level)
  return if level.nil?

  if !Niveles.has_key?(level)
    raise "#{level} key not supported!"
  end

  new_level = Level.find_or_initialize_by_name(Niveles[level][0])

  if !new_level.persisted?
    new_level.parent = find_or_create_level(Niveles[level][1])
    new_level.save
  end

  return new_level
end

def find_or_create_levels(school, levels)
  levels.collect { |level| find_or_create_level(level) }
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
