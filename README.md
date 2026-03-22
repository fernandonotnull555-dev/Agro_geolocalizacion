# AGRO_LOCALIZACION

Sistema web (PHP + MySQL) para registrar y localizar agromercados en mapa (Leaflet + OpenStreetMap).

## Base de datos en el repositorio

Los scripts SQL están en la carpeta `database/`:

| Archivo | Uso |
|--------|-----|
| `database/install_completo.sql` | Crea la base `agro_localizacion`, la tabla `lugares` e inserta **50 puntos** de referencia de **AgroMercados del MAG** (El Salvador), con coordenadas aproximadas para el mapa. |
| `database/seed_agromercados_mag.sql` | Solo datos MAG (si la tabla ya existe). |
| `crear_tabla.sql` | Esquema mínimo (útil como referencia). |

**Importante:** GitHub almacena el *script* SQL, no un servidor MySQL. Para “que funcione” debes importar ese SQL en MySQL local, hosting o Docker (ver abajo).

## Configuración de conexión

Por defecto se usa `localhost`, usuario `root`, sin contraseña. Para Docker u otro servidor, copia `docker/config.local.php` a la raíz del proyecto como `config.local.php` y ajusta host, usuario y contraseña (el archivo `config.local.php` está en `.gitignore` para no subir secretos).

## Probar con Docker (recomendado)

Requisitos: [Docker Desktop](https://www.docker.com/products/docker-desktop/).

```bash
docker compose up --build
```

- Aplicación: <http://localhost:8080>
- MySQL se inicializa solo con `database/install_completo.sql` la **primera vez** (volumen nuevo).

Si cambias el SQL de inicio y necesitas recargar datos, borra el volumen: `docker compose down -v` y vuelve a subir los contenedores.

## Probar con XAMPP (Windows)

1. Coloca el proyecto en `htdocs`.
2. Importa `database/install_completo.sql` en phpMyAdmin.
3. Abre en el navegador la URL del proyecto (por ejemplo `http://localhost/AGRO_LOCALIZACION/`).

## Mapa y búsqueda

- Al abrir **Buscar Agromercado**, se cargan los puntos MAG en el mapa.
- La búsqueda coincide con **nombre** o **dirección** (departamento, municipio, referencia del volante).
- Si no hay coincidencias en la base, se intenta geocodificar con Nominatim (OpenStreetMap) limitado a El Salvador.

## Subir el código a GitHub

1. Crea un repositorio vacío en GitHub (sin README si ya tienes uno local).
2. En la carpeta del proyecto:

```bash
git init
git add .
git commit -m "Proyecto AGRO_LOCALIZACION con datos MAG y Docker"
git branch -M main
git remote add origin https://github.com/TU_USUARIO/TU_REPO.git
git push -u origin main
```

GitHub **no ejecuta PHP** en páginas estáticas gratuitas; para una demo online necesitas un hosting con PHP y MySQL (por ejemplo InfinityFree, Railway, servidor propio) o solo compartir el repositorio y ejecutar localmente / con Docker.

## Notas sobre coordenadas

Las posiciones de los AgroMercados MAG son **aproximadas** (centro urbano o punto de referencia). Puedes refinarlas geocodificando direcciones exactas y actualizando la tabla `lugares`.
