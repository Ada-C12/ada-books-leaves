# Set Ruby version and install dependencies
FROM ruby:2.5
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# Create folder for Rails app and 
RUN mkdir /myapp
WORKDIR /myapp

# run bundle install
RUN gem install bundler
COPY ./Gemfile /myapp
COPY ./Gemfile.lock /myapp
RUN bundle install

COPY . /myapp


# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
# It runs rails server -b on localhost (for the container)
CMD ["rails", "server", "-b", "0.0.0.0"]
