## Metadata
* URL: [https://hosting.analythium.io/we-need-to-talk-about-docker-registries/](https://hosting.analythium.io/we-need-to-talk-about-docker-registries/)
* Author: [[Peter Solymos]]
* Publisher: [[hosting.analythium.io]]
* Published Date: 2022-07-22

## Highlights
* A Docker registry stores Docker images, this is where we push images to and pull images from.
* If you want a registry hosted on your machine, just pull the registry image.
* If you want your own registry to be accessed over a network, then you need to think about security and access control.
* When you work with private registries or private images, you need to log in with the docker login command. For Docker Hub, just type docker login. For all other registries, type in the registry URL as well, e.g. docker login ghcr.io.
* You can log in programmatically by providing your username and the password through standard input:
* As an alternative, the password can be provided via a file, this approach won't leave trace of your token in your history:
* The credentials will be stored locally: in $HOME/.docker/config.json on Linux or %USERPROFILE%/.docker/config.json on Windows. After login, there is no need to re-authenticate until you log out with docker logout.
* It is always a good idea to use a token instead of your password. Tokens can have limited scope (i.e. only for pulling images), and can be revoked at any time without it impacting other areas of your life.
* GitHub container registry (the ghcr.io URL from above) is available as part of GitHub Packages for free and paid plans, even for private repositories under the free plan. This registry requires authentication using your GitHub token.
* Heroku comes with a Docker registry (registry.heroku.com) where the Docker-based deploys push the images to.
* Of course, every major cloud provider offers a Docker container registry that is often integrated with their other offerings. Latency should be minimal due to network proximity to the servers: