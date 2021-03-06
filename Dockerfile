# Build James
#
# VERSION	1.0

FROM java:openjdk-8-jdk

ENV GIT_VERSION 1:2.1.4-2.1

# Install Maven
WORKDIR /root
RUN wget http://mirrors.ircam.fr/pub/apache/maven/maven-3/3.3.1/binaries/apache-maven-3.3.1-bin.tar.gz
RUN tar -xvf apache-maven-3.3.1-bin.tar.gz
RUN ln -s /root/apache-maven-3.3.1/bin/mvn /usr/bin/mvn

# Install git
RUN apt-get update
RUN apt-get install -y git="$GIT_VERSION"

# Copy the script
COPY compile.sh compile.sh
COPY integration_tests.sh integration_tests.sh

# Define the entrypoint
WORKDIR /james-parent
ENTRYPOINT ["/root/compile.sh"]
