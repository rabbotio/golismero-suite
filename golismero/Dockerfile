FROM debian:jessie

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get -y install \
        git \
	    perl \
	    python \
        python-pip \
	    nmap \
	    sslscan \
	    apache2
RUN useradd -m golismero

RUN git clone https://github.com/golismero/golismero /opt/golismero
RUN ln -s /opt/golismero/golismero.py /usr/bin/golismero
ADD run.sh /usr/bin/run.sh
RUN chmod +x /usr/bin/run.sh
RUN mkdir -p /home/golismero/.golismero/
ADD golismero.conf /home/golismero/.golismero/user.conf
RUN chown -R golismero /opt/golismero
RUN chown -R golismero /home/golismero/

USER golismero
WORKDIR /opt/golismero
RUN pip install --user -r requirements.txt
RUN pip install --user -r requirements_unix.txt

ENTRYPOINT ["run.sh"]
