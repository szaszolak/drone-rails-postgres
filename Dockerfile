FROM ruby:2.6.1

RUN echo 'gem: --no-rdoc --no-ri' >> "$HOME/.gemrc"

RUN apt-get update && \
    apt-get install -y build-essential \
    libicu-dev \
    postgresql-client libpq-dev && \
    rm -rf /var/lib/apt/lists/*

COPY ./ext /ext
RUN cd /ext && make && make install && sed -i "s/hosts:.*/hosts: files mdns4_minimal [NOTFOUND=return] dns mdns4 prax/" /etc/nsswitch.conf && rm -rf /ext
