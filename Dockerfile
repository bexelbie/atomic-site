FROM fedora:23
MAINTAINER jberkus@redhat.com

LABEL RUN docker run -dt -p 4567:4567 --privileged -v "$(pwd)":/workdir middleman

RUN dnf install -y libcurl-devel zlib-devel rubygem-bundler ruby-devel git tar patch make gcc gcc-c++ redhat-rpm-config && dnf clean all && mkdir /workdir

WORKDIR /workdir

ADD Gemfile  /workdir/Gemfile
ADD Gemfile.lock /workdir/Gemfile.lock

RUN bundle install

EXPOSE 4567
ENTRYPOINT [ "bundle", "exec" ]
CMD [ "middleman", "server" ]
