FROM ruby:2.3.0

WORKDIR /usr/src/app

# Copy the Gemfile as well as the Gemfile.lock and install
# the RubyGems. This is a separate step so the dependencies
# will be cached unless changes to one of those two files
# are made.
COPY Gemfile Gemfile.lock ./
RUN bundle install --jobs 2 --retry 5

# Copy the main application.
COPY . ./

CMD bundle exec rackup --host 0.0.0.0
