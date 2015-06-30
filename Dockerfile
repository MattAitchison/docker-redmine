FROM ubuntu-debootstrap

RUN apt-get update \
    && apt-get install -y \
          patch \
          bzip2 \
          gawk \
          g++ \
          gcc \
          make \
          libc6-dev \
          patch \
          libreadline6-dev \
          zlib1g-dev \
          libssl-dev \
          libyaml-dev \
          libsqlite3-dev \
          sqlite3 \
          autoconf \
          libgdbm-dev \
          libncurses5-dev \
          automake \
          libtool \
          bison \
          pkg-config \
          libffi-dev \
          curl

RUN curl -sSL https://rvm.io/mpapis.asc | gpg --import - && \
    curl -sSL get.rvm.io | bash -s stable --ruby

ENV PATH $PATH:/usr/local/rvm/rubies/default/bin

RUN gem install bundler puma

RUN mkdir -p /usr/bin/redmine \
    && curl -sSL http://www.redmine.org/releases/redmine-3.0.3.tar.gz \
    | tar zxC /usr/bin/redmine --strip-components 1

WORKDIR /usr/bin/redmine
RUN bundle install --without development test rmagick


EXPOSE 80

CMD ["puma", "-p 3000"]
