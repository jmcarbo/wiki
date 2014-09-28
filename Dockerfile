FROM google/golang:stable

MAINTAINER Yuji ODA

ADD . /gopath/src/github.com/yujiod/wiki

RUN go get github.com/revel/cmd/revel
RUN revel build github.com/jmcarbo/wiki /usr/local/wiki

ENV DB_DRIVER sqlite3
ENV DB_SOURCE ./wiki.db

EXPOSE 5000

WORKDIR /usr/local/wiki
CMD []
ENTRYPOINT ["./run.sh"]
