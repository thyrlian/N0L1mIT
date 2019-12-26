# N0L1mIT

No Limit - 無疆

<a href="https://youtu.be/oUbpGmR1-QM?t=74"><img src="https://github.com/thyrlian/N0L1mIT/blob/master/assets/Down.gif" alt="down down down down down" width="600"></a>

## HOWTO

* Build

  ```bash
  # Assume you're in this project's root directory, where the Dockerfile is located
  docker build -t downloader .
  
  # Build with arguments, set your own passwords instead of the default ones
  docker build --build-arg EC_PASSWORD=<YourECPassword> --build-arg ADMIN_PASSWORD=<YourAdminPassword> -t downloader .
  ```

* Play

  ```bash
  # Run a container with interactive shell
  docker run -it -p 4711:4711 --name downloader downloader /bin/bash
  
  # Run a container in the background
  docker run -d -p 4711:4711 --name downloader downloader
  # Attach to the background running container
  docker exec -it downloader /bin/bash
  ```

* Manage

  - To access the admin panel ([aMuleWeb](http://wiki.amule.org/wiki/AMuleWeb)) to control aMule by web interface: `http://<YourIPAddress>:4711/`
  
  - Admin panel password: `<ADMIN_PASSWORD>`, which was set when building the Docker image
  
  - aMule download directory: `~/.aMule/Incoming`
  
  - To download ed2k file: `ed2k "<link>"`
  
  - To control aMule by command-line, using [`AMuleCMD`](http://wiki.amule.org/wiki/AMuleCMD).  E.g.: to show download queue - `show DL`
  
  - To use [aria2](https://aria2.github.io/) to download: `aria2c '<magnet_link>'`
