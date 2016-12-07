FROM zuazo/chef-local:ubuntu-14.04
MAINTAINER Mudit Jain <muditsjain@gmail.com>
RUN apt-get update
RUN apt-get upgrade -y
COPY ./cookbooks/kafka /tmp/kafka
RUN berks vendor -b /tmp/kafka/Berksfile $COOKBOOK_PATH
RUN apt-get install -y default-jre wget supervisor dnsutils
RUN apt-get install -y zookeeperd
RUN chef-client -r "recipe[kafka]"

ADD scripts/start-kafka.sh /usr/bin/start-kafka.sh
RUN chmod a+x /usr/bin/start-kafka.sh

ADD supervisor/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

RUN ls /usr/bin/supervisord

EXPOSE 2181 9092
CMD ["/usr/bin/supervisord"]
