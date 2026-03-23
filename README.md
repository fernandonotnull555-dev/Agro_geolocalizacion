- AGRO_LOCALIZACION

Sistema web (PHP + MySQL) para registrar y localizar agromercados en mapa (Leaflet + OpenStreetMap).

- Demo (GitHub Pages)

mapa, búsqueda y lista en un solo sitio. El backend PHP + MySQL sigue siendo el proyecto completo para login, reportes, etc que se pueden encontrar.

- Base de datos en el repositorio

-Los scripts SQL están en la carpeta database:

- database/install_completo.sql Crea la base agro_localizacion, la tabla lugares e inserta 50 puntos de referencia de AgroMercados del MAG (El Salvador), con coordenadas aproximadas para el mapa. database/seed_agromercados_mag.sql  Solo datos MAG (si la tabla ya existe). 

-GitHub no ejecuta PHP simplemente se hizo de esta manera  para una demo online sin necesidad de un hosting con PHP y MySQL (por ejemplo InfinityFree, Railway, servidor propio).

- Notas sobre coordenadas

Las posiciones de los AgroMercados MAG son aproximadas (centro urbano o punto de referencia). Pueden ser refinardas geocodificando direcciones exactas y actualizando la tabla Lugares, MG significa Ministerio de Agricultura y Ganadería.

-La idea original incluye un login con dos roles posibles, ususario administrador capaz de insertar y actualizar agromercados y usuario cliente capas de visualizar agromercados, su posicion en el mapa y las mejores rutas para llegar al destino ademas la opcion de emprimir reportes en pantalla

© 2026 Fernando. Todos los derechos reservados.