# docker-kafka
Apache Kafka cluster implemented with Docker
Automated using Chef

The Zookeeper container is set in zookeeper_kafka
kafka starts another container which connects to the zookeeper in the zookeeper_kafka container

Added Burrow for health check of the cluster but need to configure it to make it fully operational.
Weird error --> Failed to parse gcfg data: open /etc/burrow/burrow.cfg: no such file or directory

1. Install Docker Compose and then:
        docker-compose build
2. Run the docker compose stack which includes kafka and zookeeper:
        docker-compose up
