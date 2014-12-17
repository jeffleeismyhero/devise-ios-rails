Open Source Devise iOS Rails Backend
=================================

[![Circle CI](https://circleci.com/gh/netguru/devise-ios-rails-example.svg?style=svg)](https://circleci.com/gh/netguru/devise-ios-rails-example)
[![Code Climate](https://codeclimate.com/repos/54734062e30ba07474053280/badges/398895b59d76c0c16cd2/gpa.svg)](https://codeclimate.com/repos/54734062e30ba07474053280/feed)
[![Test Coverage](https://codeclimate.com/repos/54734062e30ba07474053280/badges/398895b59d76c0c16cd2/coverage.svg)](https://codeclimate.com/repos/54734062e30ba07474053280/feed)
[![Dependency](https://img.shields.io/gemnasium/netguru/devise-ios-rails-example.svg)](https://gemnasium.com/netguru/devise-ios-rails-example)

A rails backend for demonstrating how [Devise for iOS][ios_devise] works.

How to use
==========

After a [successfull installation](#setup) you can use `localhost:3000/doc` to trigger request at some particular endpoints.

Demo App
========

We've setup for you a demo of this server at [https://devise-ios-rails-example.herokuapp.com](https://devise-ios-rails-example.herokuapp.com). You can test how it works with either using dynamically generated swagger [docs][heroku_docs] or by using some old school curl commands:

register a user

```bash
$ curl \
-H 'Accept: application/json' \
-H 'Content-Type: application/json' \
-X POST -d '{ "user": { "email": "user@example.com", "password": "1234" } }' \
https://devise-ios-rails-example.herokuapp.com/v1/users
```

in return you will get a newly created user

```json
{
  "id": 2,
  "email": "user@example.com",
  "created_at": "2014-12-09T16:17:46.170Z",
  "updated_at": "2014-12-09T16:17:46.170Z",
  "authentication_token": "2-D9jBtnAPcP8fppzJAL"
}
```

login a user

```bash
$ curl \
-H 'Accept: application/json' \
-H 'Content-Type: application/json' \
-X POST -d '{ "user": { "email": "user@example.com", "password": "1234" } }' \
https://devise-ios-rails-example.herokuapp.com/v1/users/sign_in
```

you will get again the same data:

```json
{
  "id": 2,
  "email": "user@example.com",
  "created_at": "2014-12-09T16:17:46.170Z",
  "updated_at": "2014-12-09T16:17:46.170Z",
  "authentication_token": "2-D9jBtnAPcP8fppzJAL"
}
```

to make request to resources that are only available for registered users, you need to pass email and authentication token in your headers all the time:

```bash
$ curl \
-H 'Accept: application/json' \
-H 'Content-Type: application/json' \
-H 'X-User-Email: user@example.com' \
-H 'X-User-Token: 2-D9jBtnAPcP8fppzJAL' \
-X GET https://devise-ios-rails-example.herokuapp.com/v1/secret_spaces/new
```

response: `{ "id": null, "text": null, "created_at": null, "updated_at": null }`

in order to check how password reset works:

```bash
$ curl \
-H 'Accept: application/json' \
-H 'Content-Type: application/json' \
-X POST -d '{ "user": { "email": "user@example.com" } }' \
https://devise-ios-rails-example.herokuapp.com/v1/users/password
```

you receive response status 204 (no content). In the meantime, server sends instructions on how to reset the password, which you should follow. On heroku we use `letter_opener_web` gem therefore those emails are stored at [https://devise-ios-rails-example.herokuapp.com/letter_opener](https://devise-ios-rails-example.herokuapp.com/letter_opener).

Here is a complete list of paths:

- Useful Devise paths

```
               login - POST   /v1/users/sign_in
               login - GET    /v1/users/sign_in
            register - POST   /v1/users
         update user - PUT    /v1/users
         delete user - DELETE /v1/users
change user password - PUT    /v1/users/password
      password reset - POST   /v1/users/password
```

- Secret Spaces for demonstration purposes

```
               index - GET    /v1/secret_spaces
                show - GET    /v1/secret_spaces/:id
                 new - GET    /v1/secret_spaces/new
              create - POST   /v1/secret_spaces
                edit - GET    /v1/secret_spaces/:id/edit
              update - PUT    /v1/secret_spaces/:id
              delete - DELETE /v1/secret_spaces/password/:id
```

Requirements
============

| Name |  Version |
| :--: | :---: |
| [Ruby][ruby] | 2.1.5 |
| [Ruby on Rails][rails] | 4.1.8 |

You can find some guidelines on how to install above [on mac][mac_guidelines] and [on ubuntu][ubuntu_guidelines]

#### Optional (recommended)

- git (mac - `brew install git`, ubuntu - `apt-get install git`)


Setup
=====

- clone repo to your local machine `git clone https://github.com/netguru/devise-ios-rails.git ./devise-ios-rails`

Database config
---------------

- copy config/database.yml.sample to config/database.yml `cp config/database.yml.sample to config/database.yml`
- fill in your appropriate details in your database.yml config file, example:

```yaml
development:
  adapter: sqlite3
  host: localhost
  database: devise_ios_rails_development.sqlite3
  username: devise_ios_rails
```

- and create a database:

```bash
rake db:create
rake db:schema:load
rake db:test:prepare
```

- create seed data with `rake db:seed`

this will create:

* users:
    - registered user - ios@example.com / alcatraz

Environment config
------------------

- copy .env.sample to .env `cp .env.sample .env`
- fill your domain name and url - in local environment it's normally `localhost` and `http://localhost:3000` respectively.
- you will need to generate your own `SECRET_KEY_BASE` by running `rake secret` and pasting the output into .env file.
- you can omit Rollbar config in development environment.

Start Server
------------

Before you start app be sure that PostgreSQL is already running. Then start Rails server on default port with `rails server`.

Tests
=====

- you run tests with `spring rspec`

Other tools
===========

Spring
------

You can use [Spring][spring] to speed up specs, rake tasks and rails commands.

Just add `spring` before commands like `rspec`, `rake`, `rails`

Contribution
============

First, thank you for contributing!

Here a few guidelines to follow:

- we follow [Ruby Style Guide][ruby_style_guides].
- you can use [rubocop][rubocop] which can be easily integrated with popular editors. ([our rubocop config][rubocop_config])
- keep gems up to date - you can use [gemsurance][gemsurance] to check for outdated gems - simply run `bundle exec gemsurance`.
- write tests
- make sure the entire test suite passes
- make sure rubocop passes, our config
- open a pull request on GitHub
- [squash your commits][squash_commits] after receiving feedback

Copyright  2014 © [Netguru][netguru_url], released under the New BSD License

[heroku_docs]: https://devise-ios-rails-example.herokuapp.com/doc
[ruby]: https://www.ruby-lang.org
[rails]: http://www.rubyonrails.org
[postgres]: http://www.postgresql.org
[ios_devise]: https://github.com/netguru/devise-ios
[mac_guidelines]: https://gorails.com/setup/osx/10.10-yosemite
[ubuntu_guidelines]: https://gorails.com/setup/ubuntu/14.10
[postgres_guidelines]: https://wiki.postgresql.org/wiki/Detailed_installation_guides
[spring]: https://github.com/rails/spring
[ruby_style_guides]: https://github.com/bbatsov/ruby-style-guide
[rubocop]: https://github.com/bbatsov/rubocop
[rubocop_config]: https://github.com/netguru/hound/blob/master/config/rubocop.yml
[gemsurance]: https://github.com/appfolio/gemsurance
[squash_commits]: http://blog.steveklabnik.com/posts/2012-11-08-how-to-squash-commits-in-a-github-pull-request
[netguru_url]: https://netguru.co
