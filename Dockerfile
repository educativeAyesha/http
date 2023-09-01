FROM ubuntu:20.04
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Moscow
RUN apt-get update && apt-get install -y libgtk2.0-0 libgtk-3-0 libgbm-dev libnotify-dev libgconf-2-4 libnss3 libxss1 libasound2 libxtst6 xauth xvfb gnupg curl wget git vim sudo postgresql postgresql-contrib tzdata zip unzip && \
    apt-get clean && \
    update-ca-certificates -f 
RUN wget --quiet -O sdk.install.sh "https://get.sdkman.io" && \
    bash -c "bash ./sdk.install.sh > /dev/null && source ~/.sdkman/bin/sdkman-init.sh && sdk install java 11.0.2-open" && \
    rm -f sdk.install.sh
ENV JAVA_HOME /Users/{user}/.sdkman/candidates/java/current
ENV PATH $JAVA_HOME/bin:$PATH


#### Install Maven
RUN apt update && apt install -y maven

ENV M3_HOME /usr/local/apache-maven/apache-maven-3.6.3
ENV M3 $M2_HOME/bin
ENV MAVEN_OPTS "-Xms256m -Xmx512m"
ENV PATH $M3:$PATH

RUN export M2_HOME && export M2 && export MAVEN_OPTS && export PATH





