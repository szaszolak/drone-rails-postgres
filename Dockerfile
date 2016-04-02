FROM ruby:2.3.0

ENV PHANTOM_VERSION phantomjs-2.1.1-linux-x86_64

RUN echo 'gem: --no-rdoc --no-ri' >> "$HOME/.gemrc"

RUN apt-get update && \
    apt-get install -y build-essential \
    libfreetype6 \
    libfontconfig1 libicu-dev wkhtmltopdf \
    libpq-dev postgresql-client nodejs && \
    rm -rf /var/lib/apt/lists/* && \
    wget -O - https://bitbucket.org/ariya/phantomjs/downloads/$PHANTOM_VERSION.tar.bz2 | tar xj && \
    mv $PHANTOM_VERSION/bin/phantomjs /usr/local/bin/ && rm -rf $PHANTOM_VERSION/
