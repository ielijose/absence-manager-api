# Use an official Ruby runtime as a parent image
FROM ruby:2.7.2

# Clean and update system packages manager
RUN apt-get clean
RUN apt-get update -qq

# Install client postgres 12x
RUN apt-get -y install gnupg2 wget
RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ buster-pgdg main" |tee /etc/apt/sources.list.d/pgdg.list
RUN apt-get update -qq && apt-get -y install postgresql-client-12

# Set the working directory to /app
RUN mkdir /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app


# Bundler actions
RUN gem install bundler
RUN bundle install

# Port for service
EXPOSE 3000

ENTRYPOINT ["./entrypoints/docker-entrypoint.sh"]

