FROM alpine

RUN apk --update add redmine ruby-unicorn ruby-mysql2

WORKDIR /usr/share/webapps/redmine
COPY config/database.yml /usr/share/webapps/redmine/config/database.yml
# ENV RAILS_ENV production
# ENV RACK_ENV production
# RUN rake db:migrate

EXPOSE 80

CMD ["rackup", "-p 80"]
