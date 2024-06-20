---
date: "2022-11-29"
image:
  caption: 'Image credit: [**Christian Salas**](https://eljatib.com)'
  placement: 2
math: true
title: Biometría forestal
#excerpt: "Análisis de datos con el programa estadístico R: una introducción aplicada"
tags:
- Biometrics
- Statistics
#authors:
#- admin
summary: Se ejemplifican algunos modelos y análisis de importancia en biometría forestal.
---

# Modelos de altura-diámetro

Un modelo estadístico de altura-diámetro tiene la siguiente estructura general
\begin{equation}
   h_i=f({\theta},d_i) + \epsilon_i,  \label{eq:modh.0}
\end{equation}       
where: $h_i$ is height at the $i$-th tree;
$d_i$ is diameter at breast height at the $i$-th tree;
$f()$ is a mathematical function; 
${\theta}$ is a vector of coefficients (i.e., parameters)  of model $f()$;
$\epsilon_{i}$ is the random term for the $i$-th tree following a Gaussian 
 probability density function having an expected value of zero and variance 
  $\sigma^2_{\epsilon}$. 
 Noice that function $f()$ could either be linear o non-linear. 
 
<img src="https://i.upmath.me/svg/%5Cbegin%7Btikzpicture%7D%5Bscale%3D1.0544%5D%5Csmall%0A%5Cbegin%7Baxis%7D%5Baxis%20line%20style%3Dgray%2C%0A%09samples%3D120%2C%0A%09width%3D9.0cm%2Cheight%3D6.4cm%2C%0A%09xmin%3D-1.5%2C%20xmax%3D1.5%2C%0A%09ymin%3D0%2C%20ymax%3D1.8%2C%0A%09restrict%20y%20to%20domain%3D-0.2%3A2%2C%0A%09ytick%3D%7B1%7D%2C%0A%09xtick%3D%7B-1%2C1%7D%2C%0A%09axis%20equal%2C%0A%09axis%20x%20line%3Dcenter%2C%0A%09axis%20y%20line%3Dcenter%2C%0A%09xlabel%3D%24x%24%2Cylabel%3D%24y%24%5D%0A%5Caddplot%5Bred%2Cdomain%3D-2%3A1%2Csemithick%5D%7Bexp(x)%7D%3B%0A%5Caddplot%5Bblack%5D%7Bx%2B1%7D%3B%0A%5Caddplot%5B%5D%20coordinates%20%7B(1%2C1.5)%7D%20node%7B%24y%3Dx%2B1%24%7D%3B%0A%5Caddplot%5Bred%5D%20coordinates%20%7B(-1%2C0.6)%7D%20node%7B%24y%3De%5Ex%24%7D%3B%0A%5Cpath%20(axis%20cs%3A0%2C0)%20node%20%5Banchor%3Dnorth%20west%2Cyshift%3D-0.07cm%5D%20%7B0%7D%3B%0A%5Cend%7Baxis%7D%0A%5Cend%7Btikzpicture%7D" alt="\begin{tikzpicture}[scale=1.0544]\small
\begin{axis}[axis line style=gray,
	samples=120,
	width=9.0cm,height=6.4cm,
	xmin=-1.5, xmax=1.5,
	ymin=0, ymax=1.8,
	restrict y to domain=-0.2:2,
	ytick={1},
	xtick={-1,1},
	axis equal,
	axis x line=center,
	axis y line=center,
	xlabel=$x$,ylabel=$y$]
\addplot[red,domain=-2:1,semithick]{exp(x)};
\addplot[black]{x+1};
\addplot[] coordinates {(1,1.5)} node{$y=x+1$};
\addplot[red] coordinates {(-1,0.6)} node{$y=e^x$};
\path (axis cs:0,0) node [anchor=north west,yshift=-0.07cm] {0};
\end{axis}
\end{tikzpicture}" />





### Comentarios/sugerencias?
Cualquier error, comentario o sugerencia, no dude en contactarme [vía e-mail](mailto:cseljatib@gmail.com), mi correo es cseljatib@gmail.com. 


<!--- 
+ [Ajuste de modelo de altura-diametro](/statstuff/datosEspa.html)

#### Te parecio interesante o util? Considera compartirlo 🙌

<img src="portadaLibro.jpg" width="1000" height="350">
**Some of my older websites**
- [My old website](https://cseljatib.wixsite.com/biometria)
- [My old linux help](http://biometria.ufro.cl/myLinuxHelp/)
* [Mentoirs](./educa.md)
![](images/chacai01.jpg)
-->
