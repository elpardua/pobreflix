# Pobreflix
## Una simple guía en castellano para levantar tu home server con descargas automágicas.

Voy a tratar de hacer esta guía lo más al grano posible. Necesitás conocimientos supermínimos de linux, una pc vieja/notebook/tostadora más o menos decente, tipo core2duo, con 4gb de RAM para arriba está bien. Disco externo, o interno grande, mientras más grande, más contenidos en mejor calidad vas a poder poner. Como referencia, mi servidor de home lab que uso para otras cosas también tiene un I3 de 6ta Gen, 8GB de RAM, 512 de SSD para el sistema operativo y un disco externo USB 3.0 de 8TB, y está conectado por cable al modem de casa.

## Objetivo:
Que termines esta guía con un server con varias aplicaciones web que te permitan agendar tus pelis y series favoritas, y que las mismas se busquen automágicamente en la calidad deseada, y una vez que estén disponibles, se descarguen automáticamente y te avise por telegram que ya podés verlas usando Plex. De paso, si no conocés docker, que aprendas un toque, que tampoco está mal. Todos los componentes salvo el script y el archivo de compose, son propiedad de sus respectivos dueños, y siguen su licenciamiento original. Mi trabajo sólo está en tratar de automatizar lo más posible el deploy de este combo de contenedores. Los contenedores que usé están hachos por la gente hermosa de linuxserver.io, después péguenle una chusmeada, y pueden ampliar el archivo docker-compose.yaml con funcionalidades extra si así lo quisieran. (Home cloud, Biblioteca de Ebooks, GIT server, etc)

Vas a necesitar crearte una cuenta en plex.tv. Pim pum, password, activás, si te ofrecen drogas o algo que haya que pagar: "no gracias, sólo vengo por lo grati'"

Voy a arrancar de un escenario básico suponiendo que a tu servidor le instalaste ubuntu server, que es lo más simple y amigable, 3 giladas, siguiente siguiente siguiente y sale andando. NO INSTALES DOCKER POR DEFECTO. Vas a estar conectado con tu usuario que creaste durante la instalación, y que por defecto tiene permisos de sudoer (ejecutar cosas como si fueses root, usando tu clave personal). Las descargas por defecto van a ir en /Downloads, asi que aseguráte que haya espacio en ese disco, o si tenés un disco externo, usá ese path como punto de montaje.

## Pasos a seguir:

1- Vamos a actualizar todo nuestro server para que nos quede bien piola. En la consola ponemos:

server> sudo apt update && sudo apt upgrade -y && sudo reboot

Esto va a actualizar todo el sistema y reiniciar el servidor. Una vez que reinicie nos conectamos nuevamente por SSH.

2- Instalamos git para poder bajar este repo:

server> sudo apt install git

3- Clonás este repo en tu home directory, y le das permisos de ejecución al script:

server> git clone https://github.com/elpardua/pobreflix.git ~/pobreflix

server> cd ~/pobreflix && chmod +x instalar.sh && ./instalar.sh

4- Lo siguiente, requiere de cierta velocidad, porque plex te da un "Claim Code", que tiene que ponerse en el compose-file.yaml antes de arrancar el contenedor, y expira a los 4 minutos de generado. El instalador te va a pedir el Claim Code, pegálo y se encarga el sólo de editar el archivo y arrancar todo.








