FROM ubuntu:22.04 AS trackmania

WORKDIR /trackmania

# install necessary components
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get -y install tzdata
RUN apt-get install wget unzip -y

# downloard trackmania server
RUN wget http://files2.trackmaniaforever.com/TrackmaniaServer_2011-02-21.zip
RUN unzip TrackmaniaServer_2011-02-21.zip -d TMServer

WORKDIR /trackmania/TMServer

COPY ./commands.sh .
RUN ["chmod", "+x", "./commands.sh"]

# start server
ENTRYPOINT [ "./commands.sh" ]

## trackmania server with xaseco
FROM trackmania AS xaseco
WORKDIR /trackmania

# install php5.6 and all necessary php modules
RUN apt-get install ca-certificates apt-transport-https software-properties-common lsb-release -y
RUN add-apt-repository ppa:ondrej/php -y
RUN apt-get update
RUN apt-get install php5.6 -y
RUN apt-get install php5.6-xml -y
RUN apt-get install php5.6-mysql -y

# download xaseco file
RUN wget --referer="https://www.gamers.org/tmn/" -U="Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:129.0) Gecko/20100101 Firefox/129.0" https://www.gamers.org/tmn/xaseco_116.zip
RUN unzip xaseco_116.zip -d .

# copy files
WORKDIR /trackmania/xaseco
RUN cp newinstall/*.xml .
RUN cp newinstall/*.php includes/
RUN cp newinstall/Aseco.sh .

WORKDIR /trackmania/TMServer
# start server
ENTRYPOINT [ "./commands.sh" ]