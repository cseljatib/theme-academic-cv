---
#layout: page
##ojo que al escribirlo en extension .Rmd, me permite incluir citas via BibTeX,
##pero se desconfigura un poco la imagen. Por otro lado cuando el archivo es .rm, todo
##es OK con el texto, pero no se agrega la cita. Opte por lo segundo para que se 
##viera mejor, pero agregue a mano la cita.
title: Libro introductorio sobre el programa estadístico R
bibliography: mybibWeb.bib
link-citations: yes
output: html_document
excerpt: "Libro de R"
tags:
- R  
- Statistics
# links:
# - #icon: twitterr
#   #icon_pack: fab
#   name: Link a noticia
#   url: https://www.diariomayor.cl/ciencia-um/¿conoces-el-software-estadístico-r-profesor-lanza-libro-que-introduce-en-el-análisis-de-datos.html
# - icon: twitter
#   icon_pack: fab
#   name: Mencion en Twitter
#   url: https://twitter.com/cseljatib/status/1460667855675043843?s=20&t=20NyeERbyV3xlHUuzT74-w  
---

<style>H1{color:DarkRed;}</style>
<style>H2{color:DarkGreen;}</style>

------------------------------------------------------------------------

|                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |                                                  |
|:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------:|:-------------------------------------------------|
| Este sitio web incluye recursos que ayudan a aprender y practicar los tópicos expuestos en el libro **Análisis de datos con el programa estadístico R: una introducción aplicada** del Profesor [Christian Salas-Eljatib](http://eljatib.com) (ISBN 97895660860109). Se entregan detalles para [adquirir el libro](#comprar), [instalar el sofware R](#instar) y el [paquete del libro](#paque), y acceder a [archivos de datos](#archi) mencionados, y [scripts](#scri) para reproducir algunos gráficos avanzados del libro. | <img src="/images/portadaLibro.jpg" width="300"> |
|                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |                                                  |

------------------------------------------------------------------------

<font size="2">
Última actualización de este sitio: 02 mayo, 2024 </font>

## Adquirir

- Versión impresa: En el siguiente [**link**](https://tienda.zigzag.cl/9789566086109-analisis-de-datos-con-el-programa-estadistico-r.html) se puede realizar la compra del libro a través de la librería Zig-Zag.
- Versión epub: Disponible en [**Amazon**](https://www.amazon.com/An%C3%A1lisis-datos-programa-estad%C3%ADstico-introducci%C3%B3n-ebook/dp/B09LRHNGPL/ref=sr_1_1?keywords=Christian+Salas+Eljatib&qid=1637176913&qsid=134-6265285-4112915&s=books&sr=1-1&sres=B09LRHNGPL&srpt=ABIS_BOOK), [**GooglePlay**](https://play.google.com/store/books/details/Christian_Salas_Eljatib_An%C3%A1lisis_de_datos_con_el_p?id=15dOEAAAQBAJ&hl=es_CL&gl=US) y en [**Libros Patagonia**](https://www.librospatagonia.com/library/search/Christian%20Salas%20Eljatib).

## Instalando R

[R](https://cran.r-project.org) es un software gratuito que posee una serie de ventajas relacionadas no tan
sólo con su uso libre, sino que también respecto a reproducibilidad, docencia,
entendimiento y alta calidad [(Salas 2008)](#biblioaca). Un resumen de ciertas características que hacen a R recomendable y detalles sobre instalación se encuentran en [el material de ayuda](#ayuda).

------------------------------------------------------------------------

#### *Material de ayuda*

| Nombre                                            | Descripción                                        |
|---------------------------------------------------|----------------------------------------------------|
| [**¿Por qué R?**](/rlibro/porQueR.pdf)            | Se resumen las principales bondades de R.          |
| [**Instalar R y paquetes**](/rlibro/instalaR.pdf) | ¿Cómo instalar el software?, y otros relacionados. |
| [**Uso**](/rlibro/distroUsolibroR.pdf)            | Sobre distribución, uso y otros del libro.         |

------------------------------------------------------------------------

De todas maneras, Ud. puede visitar <https://cran.r-project.org> y seguir las instrucciones dependiendo del sistema operativo de su computador. Para [Linux](https://cran.r-project.org/bin/linux/), [MS. Windows](https://cran.r-project.org/bin/windows/), y [Mac OSX](https://cran.r-project.org/bin/macosx/).

## Paquete datana

Como una forma de reforzar los contenidos del libro,
en el paquete **datana** se encuentran todos los datos y funciones ocupadas en el libro. Usted puede por lo tanto descargarlo e instalarlo en su versión de R.

El paquete **datana** esta disponible en el repositorio oficial de paquetes de R, denominado [CRAN](https://cran.r-project.org/web/packages/available_packages_by_name.html). Esto significa
que Ud puede instalarlo directamente desde su computador, simplemente al escribir lo siguiente en la consola de R

``` r
> install.packages("datana")
```

Una descripción más específica del paquete se encuentra en su [manual](https://cran.r-project.org/web/packages/datana/datana.pdf), y de la misma forma en el [sitio del paquete en CRAN](https://cran.r-project.org/web/packages/datana/index.html).
Tal como se explica en [el material de ayuda](#ayuda), este paquete también puede ser instalado desde su archivo fuente [de extensión .tar.gz](https://cran.r-project.org/web/packages/datana/index.html).

Para utilizar el paquete **datana** en una sesión, emplear

``` r
> library(datana)
```

Para revisar todos las dataframe disponibles en el paquete, puede escribir lo siguiente
en la consola de R

``` r
> data(package = "datana")
```

Una característica clave del paquete **datana** es que cada dataframe esta disponible
con encabezados en inglés y en castellano, siendo el nombre de estas últimas dataframes terminadas siempre con el numero “2”. Por ejemplo, carguemos la dataframe **pspLlancahue** a
esta sesión y revisemos sus primeras seis observaciones

``` r
> data("pspLlancahue")
> head(pspLlancahue) #primeras seis filas
```

      tree.code spp.name dbh x.coord y.coord spp.ori
    1      A737       Ot  10     4.2    65.4      AR
    2       B66       Ot   5    54.0     9.7      AV
    3       B96       Ot   5    41.4     6.6      AV
    4      B103       Ot   5    38.2   109.7      AV
    5      B116       Ot   5    25.9   127.0      AV
    6      B239       Ot   5     5.4     5.6      AV

y en castellano por lo tanto el nombre de la dataframe es **pspLlancahue2**

``` r
> head(pspLlancahue2) 
```

      arbol especie dap coord.x coord.y especie.ori
    1  A737      Ot  10     4.2    65.4          AR
    2   B66      Ot   5    54.0     9.7          AV
    3   B96      Ot   5    41.4     6.6          AV
    4  B103      Ot   5    38.2   109.7          AV
    5  B116      Ot   5    25.9   127.0          AV
    6  B239      Ot   5     5.4     5.6          AV

## Archivos de datos y otros

El paquete contiene varios set de datos (dataframe) disponibles. Las caracteristicas de variables, fuentes y otros de cada dataframe se encuentran detalladas en el manual [**datana.pdf**](https://cran.r-project.org/web/packages/datana/datana.pdf). Sin embargo, los siguientes archivos “físicos” son necesarios para algunos pasajes del libro. Por ejemplo en la sección 4.2 “*Cargando datos*”.

- [bearsFull.dat](/rlibro/bearsFull.dat)
- [eucaLeaf.dat](/rlibro/eucaLeaf.dat)
- [fertiliza.csv](/rlibro/fertiliza.csv)
- [fvsSim.xls](/rlibro/fvsSim.xls)
- [mycontrast.R](/rlibro/mycontrast.R)
- [snaspe09.dbf](/rlibro/snaspe09.dbf)
- [ufcData.csv](/rlibro/ufcData.csv)
- [2020-03-30-CasosConfirmados.csv](/rlibro/2020-03-30-CasosConfirmados.csv)

## Gráficos avanzados

En los siguientes enlances estan disponibles los scripts para reproducir las figuras de la sección 6.3 “*Algunos otros gráficos más complejos*” del libro. Por cualquier duda no dude en escribirme.

- [Dispersión e histogramas](/rlibro/xyHist.html)
- [Dispersión con boxplots](/rlibro/xyBoxplot.html)
- [Un gráfico 3D en perspectiva](/rlibro/perspectiva3D.html)
- [Gráfico de contorno (o de curva de nivel)](/rlibro/contorno.html)
- [Series de tiempo](/rlibro/timeSerPlot.html)
- [Curvas y dispersión entre variables](/rlibro/curvasDispe.html)
- [Series de tiempo y observaciones puntuales](/rlibro/pspTempo.html)
- [Histogramas en panel y símbolos griegos](/rlibro/allHistoGreek.html)
- [Curvas y figuras en recuadros](/rlibro/innerPanelPlots.html)

### Comentarios/sugerencias?

Cualquier error tipográfico o de sintaxis, así como
comentarios o sugerencias son muy bienvenidos, y agradecería desde ya si te contactas conmigo [vía e-mail](mailto:cseljatib@gmail.com), mi correo es cseljatib@gmail.com.

## Literatura citada

- Salas C. 2008. [*¿Por qué comprar un programa estadístico si existe R?*](/publication/2008-01-01_por_que_comprar_un_). Ecología Austral 18(2): 223–231.

- Salas-Eljatib C. 2021. [*Análisis de datos con el programa estadístico R: una introducción aplicada*](/publication/2021-01-01_analisis_de_datos_co/). Ediciones Universidad Mayor,
  Santiago, Chile. 170 p.

------------------------------------------------------------------------

#### Actualizaciones no-oficiales del paquete **datana**

Para aquellos usuarios que usan frecuentemente el paquete, y dado que la actualización en el repositorio de CRAN es algo mas lenta, dejo a continuación links a versiones no-oficiales del paquete y del manual de este mismo.

- [**datana_1.0.2.tar.gz**](/rlibro/datana_1.0.2.tar.gz) `(nueva versión, 5 de noviembre 2022)`
- [**datana.pdf**](/rlibro/datana.pdf)

------------------------------------------------------------------------

<!-- ### Footer
&#10;![](/images/portadaLibro.jpg)
&#10;{#id .class height=5%}   
&#10;El documento [**distroUsolibroR.pdf**](/rlibro/distroUsolibroR.pdf) resume lo presentado en este sitio web, y puede servir de complemento a lo que acá se explica.
&#10;
|              |   |
:---|:-------------------------:
<font size="4"> Este sitio web incluye recursos que ayudan a aprender y practicar los tópicos expuestos en el libro **Análisis de datos con el programa estadístico R: una introducción aplicada** del Profesor [Christian Salas-Eljatib](http://eljatib.com) (ISBN 97895660860109). Se entregan  detalles para [adquirir el libro](#comprar), [instalar el sofware R](#instar) y el [paquete del libro](#paque), y acceder a [archivos de datos](#archi) mencionados, y [scripts](#scri) para reproducir algunos  gráficos avanzados del libro.</font>|  <img src="/images/portadaLibro.jpg" width="30" height="75">
&#10;
&#10;[Salas-Eljatib (2021)](#biblioaca), 
&#10;### Te pareció interesante o útil? Considera compartirlo 🙌
&#10;
 <font size="6"> This is my text number 6</font>
 A continuación se ofrecen enlaces para [instalar R](#instar), así como  
&#10;<font size="5"> Este sitio web incluye recursos que ayudan a aprender y practicar los tópicos expuestos en el libro **Análisis de datos con el programa estadístico R: una introducción aplicada** del Profesor [Christian Salas-Eljatib](http://eljatib.com) (ISBN 97895660860109). Se entregan  detalles para [adquirir el libro](#comprar), [instalar el sofware R](#instar) y el [paquete del libro](#paque), y acceder a [archivos de datos](#archi) mencionados, y [scripts](#scri) para reproducir algunos  gráficos avanzados del libro.</font>|  <img src="/images/portadaLibro.jpg" width="4300" height="1500">
&#10;Este sitio web incluye recursos que ayudan a aprender y practicar los tópicos que son expuestos en el libro **Análisis de datos con el programa estadístico R: una introducción aplicada** del Profesor [Christian Salas-Eljatib](http://eljatib.com) (ISBN 97895660860109). El libro editado por Ediciones Universidad Mayor es distribuído por la [Libreria Zig-Zag](https://tienda.zigzag.cl/9789566086109-analisis-de-datos-con-el-programa-estadistico-r.html).
&#10;En el siguiente [**link**](https://tienda.zigzag.cl/9789566086109-analisis-de-datos-con-el-programa-estadistico-r.html) se puede realizar la compra del libro a través de la librería.
&#10;+ [Usando un modelo de ahusamiento](/biolibro/ahusamientoTrozado.html)
* **[Miscellaneous](./misce.md)** 
<style>H2{color:DarkOrange;}</style>
<style>p{color:Black;}</style>
<img src="/images/portadaLibro.png" width="800" height="700">
salas20 /myPubs/2020hgrate_ecoModelling.pdf (https://doi.org/10.1016/j.ecolmodel.2020.109198)
ponce 17 `doi:10.3390/f8090329`
sensors cifuentes 2018 `doi:10.3390/s18103357`.
salas10 http://rchn.biologiachile.cl/pdfs/2010/3/Soto_et_al_2010.pdf
salas06 /myPubs/2006xylofagos_RebolledoSalas_Bosque.pdf
&#10;+ [**¿Por qué R?**](/rlibro/01porQueR.pdf)| por que es bueno R?
&#10;+ [**¿Por qué R?**](/rlibro/01porQueR.pdf)
&#10;Una característica clave del paquete **datana** es que 
&#10;
```r
> library(datana)
> head(pspLlancahue) #primeras seis filas
```
&#10;```
  tree.code spp.name dbh x.coord y.coord spp.ori
1      A737       Ot  10     4.2    65.4      AR
2       B66       Ot   5    54.0     9.7      AV
3       B96       Ot   5    41.4     6.6      AV
4      B103       Ot   5    38.2   109.7      AV
5      B116       Ot   5    25.9   127.0      AV
6      B239       Ot   5     5.4     5.6      AV
```
&#10;```r
> nrow(df) #numero de filas de la dataframe
```
&#10;```
NULL
```
&#10;
&#10;Last updated: August 2020 -->
