# N0L1mIT

No Limit - 無疆

<a href="https://youtu.be/oUbpGmR1-QM?t=74"><img src="https://github.com/thyrlian/N0L1mIT/blob/master/assets/Down.gif" alt="down down down down down" width="600"></a>

## What

This Docker image contains [aMule](http://www.amule.org/) and [aria2](https://aria2.github.io/), which supports **downloading** various kinds of files, such as: ed2k, magnet, and etc.

## HOWTO

* Build

  ```bash
  # Assume you're in this project's root directory, where the Dockerfile is located
  docker build -t downloader .
  
  # Build with arguments, set your own passwords instead of the default ones
  docker build --build-arg EC_PASSWORD=<YourECPassword> --build-arg ADMIN_PASSWORD=<YourAdminPassword> -t downloader .
  ```
  
  Default passwords are [here](https://github.com/thyrlian/N0L1mIT/blob/master/Dockerfile#L14-L15)

* Play

  ```bash
  # Run a container with interactive shell
  docker run -it -p 4711:4711 --name downloader downloader /bin/bash
  
  # Run a container in the background
  docker run -d -p 4711:4711 --name downloader downloader
  # Attach to the background running container
  docker exec -it downloader /bin/bash
  ```

* Trick

  A [dotfile](https://github.com/thyrlian/N0L1mIT/blob/master/.profile) has been added to the Docker image, which contains a very nice [`obfuscate`](https://github.com/thyrlian/N0L1mIT/blob/master/.profile#L1) function.  After sourcing it, you can use it easily to pack the downloaded file(s) together with a dummy file, which would change the file's MD5 signature ;)

* Manage

  - To access the admin panel ([aMuleWeb](http://wiki.amule.org/wiki/AMuleWeb)) to control aMule by web interface: `http://<YourIPAddress>:4711/`
  
  - Admin panel password: `<ADMIN_PASSWORD>`, which was set when building the Docker image
  
  - aMule download directory: `~/.aMule/Incoming`
  
  - To download ed2k file: `ed2k "<link>"`
  
  - To control aMule by command-line, using [`aMuleCMD`](http://wiki.amule.org/wiki/AMuleCMD).  E.g.: to show download queue - `show DL`
  
  - To use [aria2](https://aria2.github.io/) to download: `aria2c '<magnet_link>'`

* Done

  To stop and remove unwanted container(s)
  
  ```bash
  temp=$(docker ps -a | grep 'downloader' | awk '{ print $1 }'); docker stop $temp &> /dev/null && docker rm $temp &> /dev/null
  ```
