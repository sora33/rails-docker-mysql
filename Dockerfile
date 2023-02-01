FROM node:16 as node
FROM ruby:3.0.2
COPY --from=node /opt/yarn-* /opt/yarn
COPY --from=node /usr/local/bin/node /usr/local/bin/
RUN ln -fs /opt/yarn/bin/yarn /usr/local/bin/yarn \
    && ln -fs /opt/yarn/bin/yarnpkg /usr/local/bin/yarnpkg
RUN apt-get update -qq 

RUN mkdir /app
WORKDIR /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install
COPY . /app
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]


# FROM ruby:alpine3.13
# RUN apk update \
#       && apk add --no-cache gcc make libc-dev g++ mariadb-dev tzdata nodejs~=14 yarn
# WORKDIR /myapp
# COPY Gemfile .
# COPY Gemfile.lock .
# RUN bundle install --jobs=2
# COPY . /myapp
# COPY ./entrypoint.sh /usr/bin/
# RUN chmod +x /usr/bin/entrypoint.sh
# ENTRYPOINT ["entrypoint.sh"]
# EXPOSE 3000
# CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
