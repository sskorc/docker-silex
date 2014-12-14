# docker-silex

This is a simple _Hello World_ project written in [Silex](http://silex.sensiolabs.org/), running on [Docker](http://www.docker.com/).

## How to use it?

Basically, you need to have [Docker installed](http://docs.docker.com/installation/).

### Build an image

Build an image based on `Dockerfile`:

```
docker build -t docker-silex .
```

### Run a container

Run a container based on created image:

```
docker run -d docker-silex
```

### Check container's IP address
```
docker inspect --format='{{ .NetworkSettings.IPAddress }}' $(docker ps -l -q)
```

### Test the app
Curl or open in a web browser path based on IP address followed by `/hello/World` eg.:

```
curl http://172.17.0.5/hello/World
```