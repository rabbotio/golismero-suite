FROM debian:jessie

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get -y install \
        wget \
        netcat \
        git \
	    perl \
	    python \
        python-pip \
	    nmap \
	    sslscan \
	    apache2
RUN useradd -m golismero

RUN git clone https://github.com/lrvick/golismero /opt/golismero && \
    cd /opt/golismero && \
    git checkout develop && \
    git reset --hard 846960a352127f5b73f9c5acbb4006ed8c0af434

# Generate OpenVAS Plugin Database
RUN cd /opt/golismero/plugins/testing/scan/openvas_plugin && \
    mkdir -p nvt_feed && \
    wget http://www.openvas.org/openvas-nvt-feed-current.tar.bz2 && \
    tar -vjxf openvas-nvt-feed-current.tar.bz2 -C nvt_feed && \
    python setup.py -p nvt_feed -v && \
    rm openvas-nvt-feed-current.tar.bz2

RUN ln -s /opt/golismero/golismero.py /usr/bin/golismero
ADD run.sh /usr/bin/run.sh
RUN chmod +x /usr/bin/run.sh
RUN mkdir -p /home/golismero/.golismero/
RUN mkdir -p /home/golismero/results
ADD golismero.conf /home/golismero/.golismero/user.conf
RUN chown -R golismero /opt/golismero
RUN chown -R golismero /home/golismero/

USER golismero
WORKDIR /opt/golismero
RUN pip install --user -r requirements.txt
RUN pip install --user -r requirements_unix.txt

ENTRYPOINT ["run.sh"]
