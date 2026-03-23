- AGRO_LOCALIZACION

Sistema web (PHP + MySQL) para registrar y localizar agromercados en mapa (Leaflet + OpenStreetMap).

- Demo (GitHub Pages)



mapa, búsqueda y lista en un solo sitio. El backend PHP + MySQL sigue siendo el proyecto completo para login, reportes, etc que se pueden encontrar.

- Base de datos en el repositorio

Los scripts SQL están en la carpeta `database/`:

| Archivo | Uso |
|--------|-----|
| `database/install_completo.sql` | Crea la base `agro_localizacion`, la tabla `lugares` e inserta **50 puntos** de referencia de **AgroMercados del MAG** (El Salvador), con coordenadas aproximadas para el mapa. |
| `database/seed_agromercados_mag.sql` | Solo datos MAG (si la tabla ya existe). |
| `crear_tabla.sql` | Esquema mínimo (útil como referencia). |

Importante: GitHub almacena el script SQL, no un servidor MySQL. Para que la idea original funcione  debe de ser importadp ese SQL en algun hoisting en la nube de maria db.



GitHub no ejecuta PHP en páginas estáticas gratuitas; para una demo online necesitas un hosting con PHP y MySQL (por ejemplo InfinityFree, Railway, servidor propio) o solo compartir el repositorio y ejecutar localmente / con Docker.

- Notas sobre coordenadas

Las posiciones de los AgroMercados MAG son aproximadas (centro urbano o punto de referencia). Pueden ser refinardas geocodificando direcciones exactas y actualizando la tabla `lugares`.
