
<!-- ==================================================================================================== -->

---
# **TrabajoOpenData** - _Daniel Marín_
---

<br>

<!-- ==================================================================================================== -->

<!-- ===== REFERENCIAS ===== -->

[PDE]: https://docs.google.com/presentation/d/1ZGtemNMhVohsCC2PnnbQ7edXZn5R5n9pzkv9R-fOJ1k/edit?usp=sharing

[README]: https://github.com/dmarinmdam1/TrabajoOpenData/blob/versiones/README.md
[GITIGNORE]: https://github.com/dmarinmdam1/TrabajoOpenData/blob/versiones/.gitignore

[DESARROLLO]: https://github.com/dmarinmdam1/TrabajoOpenData/tree/desarrollo
[VERSIONES]: https://github.com/dmarinmdam1/TrabajoOpenData/tree/versiones
[MASTER]: https://github.com/dmarinmdam1/TrabajoOpenData/tree/master

[APLICACION]: https://github.com/dmarinmdam1/TrabajoOpenData/tree/versiones/Aplicacion
[DOCESQ]: https://github.com/dmarinmdam1/TrabajoOpenData/tree/versiones/Documentacion%20Esquematica

[BNB]: https://api.flutter.dev/flutter/material/BottomNavigationBar-class.html

<!-- ==================================================================================================== -->

## **Tabla de contenidos** <a name="TDC"></a>

<br>

- [**Tabla de contenidos**](#TDC) (meta)

- [**Información preliminar sobre el propio** `README.md`](#IPSEPR) (meta)

- [**Descripción de la aplicación**](#DDLA)

- [**Presentación con Documentación Esquemática**][PDE] (link externo, no es un apartado del [`README.md`][README])

- [**Descripción de las ramas**](#DDLR)

- [**Características secundarias a desarrollar**](#CCAD)

- [**Registro de progreso**](#RDP)

<br>

---

<!-- ==================================================================================================== -->

<br>

## **Información preliminar sobre el propio README.md** _(meta)_ <a name="IPSEPR"></a>

Tanto la información contenida en este archivo como su disposición están sujetos a la probable posibilidad de ser modificados numerosas veces en el futuro. Lo detallada y organizada que esté la información aquí presentada está directamente relacionado con el tiempo del que disponga y las energías que me queden en el momento de trabajar en ello.

> No se si es una suerte o una desgracia pero mi potencial y mis resultados están limitados por el tiempo del que dispongo. 

<br>

---

<!-- ==================================================================================================== -->

<br>

## **Descripción de la aplicación** <a name="DDLA"></a>

**La aplicación permite consultar las farmacias de guardia de Navarra que estén disponibles los próximos ~10 días.**

Al abrirse, comprueba si dispone de conexión a internet. De ser así, descarga la informaciónmás reciente sobre las farmacias de guardia. Si no, informa al usuario de cuántos días  en elfuturo puede consultar farmacias de guardia, determinados por la antigüedad de la informaciónactual (pudiendo estar tan desactualizada que no dispone de información para mostrar. En este caso, la aplicación se cerrará ya que no podría cumplir su función principal).

Después se abrirá la pantalla del mapa en la que se mostrarán las farmacias de guardia cercanas a la ubicación del usuario. Si se selecciona una farmacia en el mapa, se mostrará la información completa de ésta. Si se prefiere visualizar la información en forma de lista, existe una pantalla que muestra de esta forma las farmacias de guardia, pudiendo filtrarlas de diferentes formas.

Por último, con el fin de permitirle al usuario personalizar su experiencia con la app, existe una pantalla de configuración con distintas opciones a modificar e información acerca de la propia aplicación.

Para navegar entre estas 3 pantallas principales, siempre visible en la parte inferior de la pantalla tendremos un [BottomNavigationBar][BNB].

<br>

---

<!-- ==================================================================================================== -->

<br>

## **Descripción de las ramas** <a name="DDLR"></a>

- [`desarrollo`][DESARROLLO] : rama a la que se subirá todo el progreso del proyecto sin importar su funcionalidad

- [`versiones`][VERSIONES] : rama en la que se publicará el progreso presentable de cada día

- [`master`][MASTER] : rama en la que se publicarán las versiones de la app presentables al público

<br>

---

<!-- ==================================================================================================== -->

<br>

## **Características secundarias a desarrollar** <a name="CCAD"></a>

- [X] Poner en el registro de progreso una tabla que enumere las semanas de trabajo y que cada semana contenga los días que la compone
- [ ] Comprobar que el archivo descargado con las farmacias de guardia sea válido (que no tenga errores)
- [ ] Probar si se Markdown se procesa dentro de tablas (para dividir todo el registro de proceso en dos columnas)

<br>

---

<!-- ==================================================================================================== -->

<br>

## **Registro de progreso** <a name="RDP"></a>

<br>

| Orden cronológico | Recientes primero |
| :- | :- |
| **Semana 1** | **Semana 2** |
| [Día 1 - (21/10/2020) - Primer commit](#D1) | [Día 5 - (31/10/2020) - Empezamos con la App en sí](#D5) | |
| [Día 2 - (26/10/2020) - Punto de partida](#D2) | **Semana 1** |
| [Día 3 - (27/10/2020) - Pequeños retoques a la base](#D3) | [Día 4 - (29/10/2020) - Presentación con Documentación Esquemática](#D4) |
| [Día 4 - (29/10/2020) - Presentación con Documentación Esquemática](#D4) | [Día 3 - (27/10/2020) - Pequeños retoques a la base](#D3) |
| **Semana 2** | [Día 2 - (26/10/2020) - Punto de partida](#D2) |
| [Día 5 - (31/10/2020) - Empezamos con la App en sí](#D5) | [Día 1 - (21/10/2020) - Primer commit](#D1) |

<br>

---

<!-- ==================================================================================================== -->

## **Día 5** &nbsp; - &nbsp; (31/10/2020) &nbsp; - &nbsp; _Empezamos con la App en sí_ <a name="D5"></a>

- Actualizado el archivo [`README.md`][README]

- 

---

<!-- ==================================================================================================== -->

## **Día 4** &nbsp; - &nbsp; (29/10/2020) &nbsp; - &nbsp; _Presentación con Documentación Esquemática_ <a name="D4"></a>

- Mejorada _considerablemente_ la [Presentación con la Documentación Esquemática][PDE]

    - Creada a partir de esquemas de _draw.io_
    - Guardados en el repositorio todos los archivos del desarrollo de esta presentación

- Organizado el repositorio en 2 carpetas (con la posibilidad de añadir más en el futuro si fuera necesario): 

    - [`Aplicacion`][APLICACION] (en donde se ecuentra todo el código de la aplicación en si)
    - [`Documentacion Esquematica`][DOCESQ] (en donde se guardan todos los archivos relacionados con la [Documentación Esquemática][PDE])

- Mejorado _considerablemente también_ el archivo [`README.md`][README] para un mejor registro del progreso de este proyecto (meta)

---

<!-- ==================================================================================================== -->

## **Día 3** &nbsp; - &nbsp; (27/10/2020) &nbsp; - &nbsp; _Pequeños retoques a la base_ <a name="D3"></a>

- Mejorado el archivo [`README.md`][README]

    - (el progreso del [`README.md`][README] no será registrado en el [Registro de progreso](#RDP))
    - (ya me he dado cuenta de que es _`README.md`_ y no "_<code>README.m<b>e</b></code>_")
    - (a partir de ahora los mensajes de commit "`Actualizado el "README.md"`" estarán bien escritos)

---

<!-- ==================================================================================================== -->

## **Día 2** &nbsp; - &nbsp; (26/10/2020) &nbsp; - &nbsp; _Punto de partida_ <a name="D2"></a>

- Creado y añadido al repositorio el archivo [`README.md`][README] en el que se registrará el progreso del proyecto

    - (¿no será esto Inception al hablar del "Registro de progreso" en el "Registro de progreso"?)
    - (¿no será esto Inception al hablar de hablar del "Registro de progreso" en el "Registro de progreso"?)
    - (¿no será esto ... ?)

- Creadas las ramas [`desarrollo`][DESARROLLO] y [`versiones`][VERSIONES]

    - [`desarrollo`][DESARROLLO] : rama a la que se subirá todo el progreso del proyecto sin importar su funcionalidad

    - [`versiones`][VERSIONES] : rama en la que se publicará el progreso presentable de cada día

    - [`master`][MASTER] : rama en la que se publicarán las versiones de la app presentables al público

- Creada y terminada la [Presentación con la Documentación Esquemática][PDE]

---

<!-- ==================================================================================================== -->

## **Día 1** &nbsp; - &nbsp; (21/10/2020) &nbsp; - &nbsp; _Primer commit_ <a name="D1"></a>

- Creado el repositorio de GitHub en el que se alojará el proyecto

- Configurado SourceTree para el control de versiones

- Añadido al repositorio el archivo [`.gitignore`][GITIGNORE] cuyo contenido he sacado de internet de una plantilla de flutter

---

<!-- ==================================================================================================== -->
