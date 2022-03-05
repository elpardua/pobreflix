# mediaserver
Una simple guía en castellano para levantar tu home server con descargas automágicas.

Voy a tratar de hacer esta guía lo más al grano posible. Necesitás conocimientos supermínimos de linux, una pc vieja/notebook/tostadora más o menos decente, tipo core2duo, con 4gb de RAM para arriba está bien. Disco externo, o interno grande, mientras más grande, más contenidos en mejor calidad vas a poder poner. Como referencia, mi servidor de home lab que uso para otras cosas también tiene un I3 de 6ta Gen, 8GB de RAM, 512 de SSD para el sistema operativo y un disco externo USB 3.0 de 8TB, y está conectado por cable al modem de casa.

Objetivo:
Que termines esta guía con un server con varias aplicaciones web que te permitan agendar tus pelis y series favoritas, y que las mismas se busquen automágicamente en la calidad deseada, y una vez que estén disponibles, se descarguen automáticamente y te avise por telegram que ya podés verlas usando Plex. De paso, si no conocés docker, que aprendas un toque, que tampoco está mal.

Voy a arrancar de un escenario básico suponiendo que a tu servidor le instalaste ubuntu server, que es lo más simple y amigable, 3 giladas, siguiente siguiente siguiente y sale andando. Hay guías a patadas de eso, no me voy a meter a redundar. Vas a estar conectado con tu usuario que creaste durante la instalación, y que por defecto tiene permisos de sudoer (ejecutar cosas como si fueses root, usando tu clave personal).




