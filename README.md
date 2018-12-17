# Congestion

Descripción del proyecto

Enmarcado en el contexto de la Ingeniería Civil Informática, se creará una visualización de datos. Esta herramienta servirá como base para la toma de decisiones, eventualmente podría disminuir la congestión vehicular en Temuco, pero eso no está dentro de los alcances del proyecto.

Problema a solucionar

En la región de La Araucanía existen más de 220.000 automóviles. Lo anterior sumado con el rápido crecimiento urbano y demográfico, trae consigo un problema: El aumento en los tiempos de traslado dentro de Temuco.

Ante el problema planteado, se propone una herramienta que permita al usuario visualizar cuáles son las calles más concurridas del centro de Temuco, en tres horarios punta, las 08:00, las 13:00 y las 18:00. Siendo así una base para que el usuario tome decisiones. 


Datos utilizados

Coordenadas (Ax,Ay) y (Bx,By) que al unirse representan una cuadra.
Descripción: Información referencial, no utilizada por el programa.
Tasa de Flujo: 
“Es la frecuencia a la cual pasan los vehículos por un punto o sección transversal de un carril o calzada”. Este punto será el comienzo de la cuadra.
q =NT
Siendo N, la cantidad de vehículos que entrar a la cuadra.
Siendo T, “tiempo específico, inferior a una hora”. En este caso intervalos de 3 minutos.
Estos datos serán simulados.
El intervalo de tiempo entre cada muestra es de 3 minutos.
Tasa de Flujo 7, Tasa de Flujo 13 y Tasa de Flujo 18 representan el promedio por minuto de las muestras en cada horario.

Coordenada Ax
Coordenada Ay
Coordenada Bx
Coordenada By
Descripción
Tasa de Flujo 7
Tasa de Flujo 13
Tasa de Flujo 18
-38.736777
-72.590618
-38.746777
-72.600730
Balmaceda entre Gral Mackenna y Cruz
0
2.7
1.06667

En la siguiente tabla se detalla, que representará cada color que se mostrará en el mapa de la visualización.

Color
Significado
Rojo
q >= 2.5
Azul
2 < q < 2.5
Verde
0 <= q <= 2
Negro
Prohibido el tránsito a vehículos particulares.
Rep. -0.33333



