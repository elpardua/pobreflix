# mediaserver
Una simple guía en castellano para levantar tu home server con descargas automágicas.

Voy a tratar de hacer esta guía lo más al grano posible. Necesitás conocimientos supermínimos de linux, una pc vieja/notebook/tostadora más o menos decente, tipo core2duo, con 4gb de RAM para arriba está bien. Disco externo, o interno grande, mientras más grande, más contenidos en mejor calidad vas a poder poner. Como referencia, mi servidor de home lab que uso para otras cosas también tiene un I3 de 6ta Gen, 8GB de RAM, 512 de SSD para el sistema operativo y un disco externo USB 3.0 de 8TB, y está conectado por cable al modem de casa.

Objetivo:
Que termines esta guía con un server con varias aplicaciones web que te permitan agendar tus pelis y series favoritas, y que las mismas se busquen automágicamente en la calidad deseada, y una vez que estén disponibles, se descarguen automáticamente y te avise por telegram que ya podés verlas usando Plex. De paso, si no conocés docker, que aprendas un toque, que tampoco está mal.

Vas a necesitar crearte una cuenta en plex.tv. Pim pum, password, activás, si te ofrecen drogas o algo que haya que pagar: "no gracias, sólo vengo por lo grati'"

Voy a arrancar de un escenario básico suponiendo que a tu servidor le instalaste ubuntu server, que es lo más simple y amigable, 3 giladas, siguiente siguiente siguiente y sale andando. Hay guías a patadas de eso, no me voy a meter a redundar. Vas a estar conectado con tu usuario que creaste durante la instalación, y que por defecto tiene permisos de sudoer (ejecutar cosas como si fueses root, usando tu clave personal). Las descargas por defecto van a ir en /Downloads, asi que aseguráte que haya espacio en ese disco, o si tenés un disco externo, usá ese path como punto de montaje.

1- Vamos a actualizar todo nuestro server para que nos quede bien piola. En la consola ponemos:

server> sudo apt update && sudo apt upgrade && sudo reboot

Si te pregunta algo, dale a todo que si, va a actualizar todo el sistema y reiniciar el servidor. Una vez que reinicie nos conectamos nuevamente por SSH.

2- Instalamos los paquetes necesarios:

server> sudo apt install docker.io docker-compose -y

una vez que termine, activamos el servicio de docker para que arranque en el booteo.

server> sudo systemctl enable docker --now

Agregamos nuestro usuario al grupo docker y reiniciamos para ver si aplicó todo.

server> sudo usermod -a -G docker $USER && sudo reboot

Nos conectamos por SSH una vez booteado, y deberíamos de poder conectarnos al docker engine desde nuestro usuario

server> docker ps            
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES

Si no te responde esto, o no puede conectar al docker engine, @elpardua en twitter y lo vemos.

Ahora vamos a bajar mi compose-file previamente armado para facilitar las cosas. Compose te permite armar tu "receta de contenedores" en un solo archivo y deployarlo en una nada.

server> mkdir compose && cd compose && curl path al raw (cambiar)

Lo siguiente, requiere de cierta velocidad, porque plex te da un "Claim Code", que tiene que ponerse en el compose-file.yml antes de arrancar el contenedor, y expira a los 4 minutos de generado. Si usás vim, no tengo que explicarte mucho, si nunca editaste archivos en linux con nano nombre_del_archivo podés editarlo y con Ctrl+O y Ctrl+X guardás y salís rápido.

Generás el claim code desde tu browser con tu cuenta de plex logueada, entrando en https://www.plex.tv/claim/, copiás el código y lo pegás reemplazando el CLAIM_CODE de mi archivo.

server> nano compose-file.yaml && docker-compose up -d

Esto debería tirar magia y cañitas por todos lados, y desplegar los contenedores. Una vez finalizado, podés ver que contenedores están activos con 

server> docker ps







