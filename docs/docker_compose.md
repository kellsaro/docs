##  With Docker compose

After [install docker compose](https://docs.docker.com/compose/install)

See the docker image in the [repo](https://github.com/cenit-io/cenit-docker)

For run this image you need to configure the conection with MongoDB and RabbitMQ, if you prefer Docker Compose you can use the following orchestration:

```yaml
version: '3.7'

volumes:
  # We'll define a volume that will store the data from the mongo databases:
  mongodb-data: {}

services:
  cenit:
    environment:
      - ENABLE_RERECAPTCHA=false
      - DB_PORT=mongodb
      - RABBITMQ_BIGWIG_TX_URL=amqp://cenit_rabbit:cenit_rabbit@rabbitmq/cenit_rabbit_vhost
      - UNICORN_WORKERS=5
      - MAXIMUM_UNICORN_CONSUMERS=3
      - DB_PROD='cenit_prod'
    build: .
    ports:
      - "80:80"
    depends_on:
      - mongodb
      - rabbitmq

  rabbitmq:
    image: rabbitmq
    ports:
      - "15672:15672"
      - "5672:5672"
    environment:
      RABBITMQ_DEFAULT_PASS: cenit_rabbit
      RABBITMQ_DEFAULT_USER: cenit_rabbit
      RABBITMQ_DEFAULT_VHOST: cenit_rabbit_vhost
    labels:
        NAME: "rabbitmq-server"

  mongodb:
    image: mongo:3.2
    volumes:
      # We'll mount the 'mongodb-data' volume into the location mongodb stores it's data:
      - mongodb-data:/data/db
```

You can then run using Docker Compose:
```bash
docker-compose up -d
```
