# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version - 3.2.2

* System dependencies - Docker, Postgres

* Configuration - none

* Database creation - `rails db:create`

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## Setup 

1. To run the application in development build an image:
```bash
$ docker-compose build
```

2. Setup test and development databases:

```bash
$ docker-compose run app bundle exec rails db:setup
```

3. To start rails application server execute (port 3000):

```bash
$ docker-compose up
```

## TODO 

* <del> Change versions of gems, ruby </del>
* <del>Add todo list to README</del> 
* <del>Add rspec</del> 
* <del>Add rubocop, rubocop-rails, rubocop-rspec rubocop-performance</del>
* <del>Update bundler</del>
* <del>Add docker, docker-compose add readme to how to run</del/>
* Add simplecov, database_cleaner-active_record, rspec-rails
* Add controller (rswag/request test) for success index
* Add controller, route, action index, view
* Add comment about authorization
* Add database set import
* Add seeds
* Add elasticsearch
* Add search feature
* Add breakeman, bundle-audit
* Add deployment configs 
* Improve readme.  
* Clean Rails
