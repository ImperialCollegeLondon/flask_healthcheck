# Flask Healthcheck Server

A simple flask server providing a single GET endpoint that returns a simple
hello world message. This server is intended to be deployed as a simple
healthcheck alongside other services that don't support HTTP.

The RSE group has a Ciao server setup for monitoring the availability of our
HTTP services. This works well for web servers but on occasion we deploy
services that we want to monitor that don't serve HTTP connections. In that case
this server can be deployed as part of the service and checked in our standard
way. Note that this is only a very crude check. It helps ensure that the service
has not been left off or killed but cannot assure the service is actually
running correctly.

It should be added to a `docker-compose.override.yml` file for the service in
question. Something like:

```yaml
version: "3"
services:
  healthcheck:
    image: ghcr.io/imperialcollegelondon/flask_healthcheck:latest
    ports:
      - 5000:5000
    restart: unless-stopped
```

Then Ciao should be configured to check it.
