FROM alpine

RUN apk --update add redmine ruby-unicorn ruby-mysql2

WORKDIR /usr/share/webapps/redmine
COPY config/database.yml /usr/share/webapps/redmine/config/database.yml

EXPOSE 80

CMD ["rackup", "-p 80"]
