# docker-kafka
Apache Kafka cluster implemented with Docker
Automated using Chef

The Zookeeper container is set in zookeeper_kafka
kafka starts another container which connects to the zookeeper in the zookeeper_kafka container
