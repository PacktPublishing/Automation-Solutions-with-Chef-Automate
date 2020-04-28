# hab-two-tier

This Habitat project illustrates a basic Apache web application (`webapp`) and HAProxy load balancer (`haproxy`).

The Docker Compose file brings up HAProxy and two load-balanced webapp instances.

## Build and Export the packages (inside the studio)

```
$ hab studio enter
$ build webapp
# Grab the built artifact, i.e. "Artifact: /src/results/learn-chef-webapp-0.2.0-20180105200724-x86_64-linux.hart"
$ hab pkg export docker results/learn-chef-webapp-0.2.0-20180105200724-x86_64-linux.hart
$ build haproxy
# Grab the built artifact, i.e. "Artifact: /src/results/learn-chef-haproxy-1.6.11-20180105200724-x86_64-linux.hart"
$ hab pkg export docker results/learn-chef-haproxy-1.6.11-20180105200724-x86_64-linux.hart
```

## Build and Export the packages (outside the studio)

```
$ hab pkg build webapp
# Grab the built artifact, i.e. "Artifact: results/learn-chef-webapp-0.2.0-20180105200724-x86_64-linux.hart"
$ hab pkg export docker results/learn-chef-webapp-0.2.0-20180105200724-x86_64-linux.hart

$ hab pkg build haproxy
# Grab the built artifact, i.e. "Artifact: results/learn-chef-haproxy-1.6.11-20180105200724-x86_64-linux.hart"
$ hab pkg export docker results/learn-chef-haproxy-1.6.11-20180105200724-x86_64-linux.hart
```

## Run

```
$ docker-compose up -d
$ curl localhost:8000/cgi-bin/hello-world
$ docker-compose down
```
