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

## Ver la app en la nube (sin usar tu PC como servidor)

Necesitas un **hosting con PHP y MySQL** (gratis o de pago). GitHub Pages **no sirve** para ejecutar PHP.

### Opción recomendada: hosting gratuito (PHP + MySQL)

Servicios típicos: [InfinityFree](https://www.infinityfree.net/), [000webhost](https://www.000webhost.com/) u otro con **PHP 7.4+**, **MySQL** y **FTP** o despliegue desde Git.

Pasos generales:

1. **Crea una cuenta** y un sitio web en el panel del hosting (te darán una URL pública tipo `tusitio.epizy.com`).
2. **Crea una base de datos MySQL** en el panel y anota: **servidor/host** (a veces no es `localhost`), **usuario**, **contraseña**, **nombre de la base**.
3. **Sube los archivos del proyecto** (FTP, administrador de archivos o Git si el plan lo permite) a la carpeta pública (`htdocs`, `public_html`, etc.).
4. Entra a **phpMyAdmin** del hosting, selecciona tu base e **importa** `database/install_completo.sql` (o solo el contenido de `seed` si la tabla ya la creaste tú).
5. Configura la conexión en el servidor, **una de estas dos formas**:
   - **Archivo `config.local.php`** en la raíz del sitio (junto a `index.php`), con los datos del panel:

```php
<?php
$DB_HOST = 'el_host_que_te_dio_el_panel';
$DB_USER = 'tu_usuario_mysql';
$DB_PASS = 'tu_contraseña_mysql';
$DB_NAME = 'nombre_de_tu_base';
```

   - O variables de entorno si el hosting las permite: `DB_HOST`, `DB_USER`, `DB_PASS`, `DB_NAME` (tienen prioridad sobre `config.local.php` para esos valores).

6. Abre en el navegador tu URL + `index.php` o `login_agro.html`.

**Nota:** No subas `config.local.php` a GitHub si contiene contraseñas; en el servidor sí debe existir para que la app se conecte a la base.

### Opción avanzada: PaaS con Docker (Railway, Render, etc.)

Puedes desplegar un contenedor PHP y un MySQL gestionado; suele requerir tarjeta o plan de pago. En ese caso define las variables `DB_HOST`, `DB_USER`, `DB_PASS`, `DB_NAME` en el panel del servicio.

## Configuración de conexión (local)

Por defecto: `localhost`, usuario `root`, sin contraseña. En local, puedes copiar `docker/config.local.php` a la raíz como `config.local.php` (ese archivo en la raíz está en `.gitignore`).

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
