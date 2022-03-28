# Poker Thing

## Installation

Pre-requisites

Have a development environment with docker set up.

Clone and build the app

```
git clone git@github.com:cheeseandpepper/poker.git
docker build .
docker-compose up
```

To seed the db

```
docker-compose exec web bash
bundle exec rails db:create
bundle exec rake db:migrate
bunlde exec rake db:setup
```

To run tests

```
docker-compose exec web bash
bundle exec rspec
```

See README_2 for some planning notes
See README_3 for some after thoughts.