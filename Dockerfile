FROM alpine

RUN apk --update add redmine ruby-sqlite

WORKDIR /usr/share/webapps/redmine

ENV RAILS_ENV production
ENV RACK_ENV production
RUN rake db:migrate

EXPOSE 80

CMD ["rackup", "-p 80"]
