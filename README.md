PROBLEMÁTICA A RESOLVER

La base de datos riverplate está diseñada para gestionar información detallada sobre el equipo de fútbol masculino de Primera División del Club Atlético River Plate (CARP). Resuelve la problemática de organizar, almacenar y relacionar datos de gran relevancia sobre: la composición del plantel, las competencias en las que participa el equipo y el rendimiento de cada jugador y del equipo.

DESCRIPCIÓN DE LAS TABLAS DE LA BASE DE DATOS

1. **Tabla `posicion`**  
   - **Descripción**: Registra el rol de los integrantes del plantel, sean jugadores o parte del cuerpo técnico.
   - **Columnas**: 
     - `id_posicion` (INT, PK)
     - `posicion` (VARCHAR)

2. **Tabla `competicion`**  
   - **Descripción**: Almacena los torneos o competencias, nacionales e internacionales, en los que participa el club.
   - **Columnas**:
     - `id_competicion` (INT, PK)
     - `nombre_competicion` (VARCHAR)
     - `alcance` (VARCHAR)

3. **Tabla `estadio_del_mundo`**  
   - **Descripción**: Información sobre estadios en diferentes países, en donde el club juega distintos partidos.
   - **Columnas**:
     - `id_estadio` (INT, PK)
     - `nombre_estadio` (VARCHAR)
     - `pais` (VARCHAR)
     - `ciudad` (VARCHAR)
     - `capacidad` (INT)

4. **Tabla `arbitro`**  
   - **Descripción**: Registra los árbitros que pueden dirigir los partidos.
   - **Columnas**:
     - `id_arbitro` (INT, PK)
     - `nombre` (VARCHAR)
     - `apellido` (VARCHAR)
     - `pais_nacimiento` (VARCHAR)

5. **Tabla `plantel`**  
   - **Descripción**: Almacena datos de los jugadores del equipo, incluyendo estadísticas personales.
   - **Columnas**:
     - `id_integrante` (INT, PK)
     - `id_posicion` (INT, FK -> `posicion.id_posicion`)
     - `nombre` (VARCHAR)
     - `apellido` (VARCHAR)
     - `fecha_nacimiento` (DATE)
     - `edad` (INT)
     - `pais_nacimiento` (VARCHAR)
     - `inicio_contrato` (DATE)
     - `fin_contrato` (DATE)
     - `goles` (INT)
     - `asistencias` (INT)
     - `clausula` (DECIMAL)

6. **Tabla `partido`**  
   - **Descripción**: Registra los partidos jugados por el club.
   - **Columnas**:
     - `id_partido` (INT, PK)
     - `id_competicion` (INT, FK -> `competicion.id_competicion`)
     - `id_estadio` (INT, FK -> `estadio_del_mundo.id_estadio`)
     - `id_club` (INT, FK -> `club_del_mundo.id_club`)
     - `id_arbitro` (INT, FK -> `arbitro.id_arbitro`)
     - `fecha` (DATE)
     - `goles_realizados` (INT)
     - `goles_recibidos` (INT)

7. **Tabla `club_del_mundo`**  
   - **Descripción**: Información sobre otros clubes a los que nos enfrentamos.
   - **Columnas**:
     - `id_club` (INT, PK)
     - `id_estadio` (INT, FK -> `estadio_del_mundo.id_estadio`)
     - `nombre_club` (VARCHAR)
     - `pais` (VARCHAR)
     - `ciudad` (VARCHAR)

8. **Tabla `plantel_partido`**  
   - **Descripción**: Relaciona los jugadores con los partidos, registrando su desempeño individual.
   - **Columnas**:
     - `id_plantel_partido` (INT, PK)
     - `id_integrante` (INT, FK -> `plantel.id_integrante`)
     - `id_partido` (INT, FK -> `partido.id_partido`)
     - `goles` (INT)
     - `asistencias` (INT)

RELACIONES ENTRE LAS TABLAS DE LA BASE DE DATOS

1. **plantel** ↔ **posicion**  
   - **Relación**: Muchos a uno
   - **Descripción**: Cada jugador tiene una posición específica en `posicion`.

2. **partido** ↔ **competicion**  
   - **Relación**: Muchos a uno
   - **Descripción**: Cada partido pertenece a una competencia en `competicion`.

3. **partido** ↔ **estadio_del_mundo**  
   - **Relación**: Muchos a uno
   - **Descripción**: Cada partido se juega en un estadio en `estadio_del_mundo`.

4. **partido** ↔ **club_del_mundo**  
   - **Relación**: Muchos a uno
   - **Descripción**: Cada partido se juega contra un club en `club_del_mundo`.

5. **partido** ↔ **arbitro**  
   - **Relación**: Muchos a uno
   - **Descripción**: Cada partido es arbitrado por un árbitro en `arbitro`.

6. **club_del_mundo** ↔ **estadio_del_mundo**  
   - **Relación**: Muchos a uno
   - **Descripción**: Cada club puede tener un estadio en `estadio_del_mundo`.

7. **plantel** ↔ **partido**  
   - **Relación**: Muchos a muchos
   - **Descripción**: Un jugador puede jugar muchos partidos y un partido es jugado por muchos jugadores. Debido a que se da esta relación de muchos a muchos, se crea la tabla `plantel_partido`.

8. **plantel_partido** ↔ **plantel**  
   - **Relación**: Muchos a uno
   - **Descripción**: Cada registro representa la actuación de un jugador en un partido específico.

9. **plantel_partido** ↔ **partido**  
   - **Relación**: Muchos a uno
   - **Descripción**: Cada registro pertenece a un partido específico.
