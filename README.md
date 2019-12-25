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
