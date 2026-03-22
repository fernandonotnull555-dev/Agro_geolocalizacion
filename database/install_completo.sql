-- Instalación completa: esquema + 50 AgroMercados MAG (referencia oficial).
-- Importar en MySQL (phpMyAdmin, CLI o Docker init).

CREATE DATABASE IF NOT EXISTS agro_localizacion CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE agro_localizacion;

CREATE TABLE IF NOT EXISTS lugares (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    direccion VARCHAR(512) NOT NULL,
    ubicacion POINT NOT NULL,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_actualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    SPATIAL INDEX(ubicacion)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DELETE FROM lugares WHERE nombre LIKE 'AgroMercado MAG - %';

INSERT INTO lugares (nombre, direccion, ubicacion) VALUES
('AgroMercado MAG - San Francisco Menéndez', 'Ahuachapán. Ahuachapán Sur. San Francisco Menéndez. Colonia La Palma.', ST_GeomFromText('POINT(-89.783300 13.850000)')),
('AgroMercado MAG - Ahuachapán (Gimnasio Los Pinitos)', 'Ahuachapán. Ahuachapán Centro. Ahuachapán. Gimnasio Los Pinitos.', ST_GeomFromText('POINT(-89.845000 13.919400)')),
('AgroMercado MAG - Metapán', 'Santa Ana. Santa Ana Norte. Metapán. Mercado municipal (ex rastro).', ST_GeomFromText('POINT(-89.450000 14.333300)')),
('AgroMercado MAG - Santa Ana (Colonia El Palmar)', 'Santa Ana. Santa Ana Centro. Santa Ana. Colonia El Palmar.', ST_GeomFromText('POINT(-89.559700 13.994200)')),
('AgroMercado MAG - Santa Ana (Skate Park, Col. El IVU)', 'Santa Ana. Santa Ana Centro. Santa Ana. Skate Park, colonia El IVU.', ST_GeomFromText('POINT(-89.565000 13.990000)')),
('AgroMercado MAG - Chalchuapa (CENTA)', 'Santa Ana. Santa Ana Oeste. Chalchuapa. CENTA Chalchuapa.', ST_GeomFromText('POINT(-89.683300 13.983300)')),
('AgroMercado MAG - El Congo (Polideportivo)', 'Santa Ana. Santa Ana Este. El Congo. Polideportivo El Congo. Nuevo.', ST_GeomFromText('POINT(-89.500000 13.950000)')),
('AgroMercado MAG - Nueva Concepción', 'Chalatenango. Chalatenango Centro. Nueva Concepción. Parque municipal.', ST_GeomFromText('POINT(-89.116700 14.066700)')),
('AgroMercado MAG - El Paraíso', 'Chalatenango. Chalatenango Norte. El Paraíso. Cancha techada del parque municipal.', ST_GeomFromText('POINT(-89.433300 13.833300)')),
('AgroMercado MAG - Chalatenango (Placita El Calvario)', 'Chalatenango. Chalatenango Sur. Chalatenango. Placita El Calvario.', ST_GeomFromText('POINT(-89.116700 14.033300)')),
('AgroMercado MAG - Acajutla', 'Sonsonate. Sonsonate Oeste. Acajutla. Mercado de Acajutla.', ST_GeomFromText('POINT(-89.827800 13.571700)')),
('AgroMercado MAG - Armenia', 'Sonsonate. Sonsonate Este. Armenia. Parque de Armenia.', ST_GeomFromText('POINT(-89.743300 13.743900)')),
('AgroMercado MAG - Izalco', 'Sonsonate. Sonsonate Este. Izalco. Parque de Izalco.', ST_GeomFromText('POINT(-89.681100 13.744400)')),
('AgroMercado MAG - Sonsonate (Parque Rafael Campos)', 'Sonsonate. Sonsonate Centro. Sonsonate. Parque Rafael Campos.', ST_GeomFromText('POINT(-89.724200 13.718900)')),
('AgroMercado MAG - Santa Tecla (Parque Daniel Hernández)', 'La Libertad. La Libertad Sur. Santa Tecla. Parque Daniel Hernández.', ST_GeomFromText('POINT(-89.289700 13.675000)')),
('AgroMercado MAG - San Juan Opico', 'La Libertad. La Libertad Centro. San Juan Opico. Anexo del parque central.', ST_GeomFromText('POINT(-89.359400 13.876100)')),
('AgroMercado MAG - Ciudad Arce', 'La Libertad. La Libertad Centro. Ciudad Arce. Parque central.', ST_GeomFromText('POINT(-89.448300 13.826400)')),
('AgroMercado MAG - Quezaltepeque', 'La Libertad. La Libertad Norte. Quezaltepeque. Parque Norberto Morán.', ST_GeomFromText('POINT(-89.272500 13.831700)')),
('AgroMercado MAG - Puerto de La Libertad', 'La Libertad. La Libertad Costa. Puerto de La Libertad. Parqueo anexo a la alcaldía municipal.', ST_GeomFromText('POINT(-89.322200 13.488300)')),
('AgroMercado MAG - Colón (Distrito 2, Nuevo Lourdes)', 'La Libertad. La Libertad Oeste. Colón. Distrito 2, Nuevo Lourdes.', ST_GeomFromText('POINT(-89.350000 13.716700)')),
('AgroMercado MAG - Zaragoza (Plaza Las Banderas)', 'La Libertad. La Libertad Este. Zaragoza. Plaza Las Banderas. Nuevo.', ST_GeomFromText('POINT(-89.216700 13.583300)')),
('AgroMercado MAG - Mejicanos (Alcaldía)', 'San Salvador. San Salvador Centro. Mejicanos. Alcaldía de Mejicanos.', ST_GeomFromText('POINT(-89.216700 13.733300)')),
('AgroMercado MAG - Ciudad Delgado (Plaza Monseñor Romero)', 'San Salvador. San Salvador Centro. Ciudad Delgado. Plaza Monseñor Romero.', ST_GeomFromText('POINT(-89.183300 13.716700)')),
('AgroMercado MAG - Ayutuxtepeque', 'San Salvador. San Salvador Centro. Ayutuxtepeque. Plaza municipal.', ST_GeomFromText('POINT(-89.200000 13.750000)')),
('AgroMercado MAG - Apopa (Parque Noé Canjura)', 'San Salvador. San Salvador Oeste. Apopa. Parque central Noé Canjura.', ST_GeomFromText('POINT(-89.183300 13.816700)')),
('AgroMercado MAG - Ilopango (Placita Bitcoin)', 'San Salvador. San Salvador Este. Ilopango. Placita Bitcoin.', ST_GeomFromText('POINT(-89.125000 13.708000)')),
('AgroMercado MAG - Ilopango (Polideportivo Altavista)', 'San Salvador. San Salvador Este. Ilopango. Esquina Polideportivo Altavista.', ST_GeomFromText('POINT(-89.108000 13.698000)')),
('AgroMercado MAG - Soyapango (Redondel Unicentro)', 'San Salvador. San Salvador Este. Soyapango. Redondel de Unicentro.', ST_GeomFromText('POINT(-89.116700 13.716700)')),
('AgroMercado MAG - San Martín (Alcaldía)', 'San Salvador. San Salvador Este. San Martín. Alcaldía de San Martín.', ST_GeomFromText('POINT(-89.050000 13.700000)')),
('AgroMercado MAG - San Marcos (Parque Joya de Esperanza y Paz)', 'San Salvador. San Salvador Sur. San Marcos. Parque Joya de Esperanza y Paz.', ST_GeomFromText('POINT(-89.183300 13.666700)')),
('AgroMercado MAG - Aguilares', 'San Salvador. San Salvador Norte. Aguilares. Parque central.', ST_GeomFromText('POINT(-89.183300 13.950000)')),
('AgroMercado MAG - Sensuntepeque', 'Cabañas. Cabañas Este. Sensuntepeque. Parque central.', ST_GeomFromText('POINT(-88.633300 13.866700)')),
('AgroMercado MAG - Ilobasco', 'Cabañas. Cabañas Oeste. Ilobasco. Parque central.', ST_GeomFromText('POINT(-88.850000 13.850000)')),
('AgroMercado MAG - Zacatecoluca', 'La Paz. La Paz Este. Zacatecoluca. Calle Dr. Nicolás Peña y Av. Narciso Monterrey.', ST_GeomFromText('POINT(-88.866700 13.516700)')),
('AgroMercado MAG - Olocuilta (Parque Ecológico)', 'La Paz. La Paz Oeste. Olocuilta. Parque Ecológico.', ST_GeomFromText('POINT(-89.116700 13.333300)')),
('AgroMercado MAG - Cojutepeque (Parque Las Alamedas)', 'Cuscatlán. Cuscatlán Sur. Cojutepeque. Parque Las Alamedas.', ST_GeomFromText('POINT(-88.933300 13.716700)')),
('AgroMercado MAG - San Rafael Cedros', 'Cuscatlán. Cuscatlán Sur. San Rafael Cedros. Frente a la alcaldía. Nuevo.', ST_GeomFromText('POINT(-88.983300 13.733300)')),
('AgroMercado MAG - Suchitoto', 'Cuscatlán. Cuscatlán Norte. Suchitoto. Frente a la alcaldía.', ST_GeomFromText('POINT(-89.083300 13.933300)')),
('AgroMercado MAG - Jocoaitique', 'Morazán. Morazán Norte. Jocoaitique. Exsupermercado Los Quebrachos.', ST_GeomFromText('POINT(-88.016700 13.916700)')),
('AgroMercado MAG - San Francisco Gotera', 'Morazán. Morazán Sur. San Francisco Gotera. Parqueo municipal estadio Luis Amílcar Moreno.', ST_GeomFromText('POINT(-88.100000 13.866700)')),
('AgroMercado MAG - San Vicente (Cancha Tacón)', 'San Vicente. San Vicente Sur. San Vicente. Esquina cancha Tacón.', ST_GeomFromText('POINT(-88.783300 13.641700)')),
('AgroMercado MAG - Apastepeque', 'San Vicente. San Vicente Norte. Apastepeque. Frente a galería Apancinte. Nuevo.', ST_GeomFromText('POINT(-88.800000 13.666700)')),
('AgroMercado MAG - Chinameca', 'San Miguel. San Miguel Oeste. Chinameca. Parque central.', ST_GeomFromText('POINT(-88.383300 13.366700)')),
('AgroMercado MAG - San Miguel (Centro de Gobierno Municipal)', 'San Miguel. San Miguel Centro. San Miguel. Centro de Gobierno Municipal.', ST_GeomFromText('POINT(-88.183300 13.483300)')),
('AgroMercado MAG - Ciudad Barrios', 'San Miguel. San Miguel Norte. Ciudad Barrios. Tiangue municipal. Nuevo.', ST_GeomFromText('POINT(-88.266700 13.750000)')),
('AgroMercado MAG - Jiquilisco', 'Usulután. Usulután Oeste. Jiquilisco. Esquina opuesta a la alcaldía municipal.', ST_GeomFromText('POINT(-88.533300 13.216700)')),
('AgroMercado MAG - Usulután (Mercado municipal #5)', 'Usulután. Usulután Este. Usulután. Mercado municipal #5.', ST_GeomFromText('POINT(-88.433300 13.350000)')),
('AgroMercado MAG - El Triunfo', 'Usulután. Usulután Norte. El Triunfo. Parqueo de la alcaldía municipal. Nuevo.', ST_GeomFromText('POINT(-88.450000 13.916700)')),
('AgroMercado MAG - La Unión (Parque central)', 'La Unión. La Unión Sur. La Unión. Parque central de La Unión.', ST_GeomFromText('POINT(-87.840800 13.331900)')),
('AgroMercado MAG - Santa Rosa de Lima (Terminal de buses)', 'La Unión. La Unión Norte. Santa Rosa de Lima. Terminal de buses de Santa Rosa de Lima.', ST_GeomFromText('POINT(-87.900000 13.616700)'));
