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

4. Create elastic import
```bash
$ docker-compose run app rake elastic:setupdb
```

## Run tests
It's required to up elastic before running test, as it took time
```bash
$ docker-compose up elasticsearch
```
After it's up
```bash
$ docker-compose run app bundle exec rspec
```

## Import dataset
```bash
$ docker-compose run app rake dataset:import
```

## TODO 

* <del>Change versions of gems, ruby </del>
* <del>Add todo list to README</del> 
* <del>Add rspec</del> 
* <del>Add rubocop, rubocop-rails, rubocop-rspec rubocop-performance</del>
* <del>Update bundler</del>
* <del>Add docker, docker-compose add readme to how to run</del>
* <del>Add controller (rswag/request test) for success index</del>
* <del>Add controller, route, action index, view</del>
* <del>Add comment about authorization</del>
* <del>Add simplecov </del>
* <del> Create Prompt model</del>
* <del>Add database set import</del>
* <del>Add database_cleaner-active_record</del>
* <del>Add elasticsearch</del>
* <del>Add search feature into model</del>
* <del>Search for 4 k => 4k</del>
* <del> Add showing all Prompts</del>
* <del>Add UI for search</del>
* <del>Add deployment configs </del>
* <del>Improve routes for main page</dev>
* <del> Add 3 d => 3d analyzer</del>
* Add 20 17 => 2017 analyzer

* Add breakeman, bundle-audit
* Improve readme.  
* Clean Rails
* Add validation for empty text in prompt
### TODO good to have
* ./lib/tasks/import_dataset.rake
  * Add logic for unsuccess request
  * Possible improvement collect all data and import it once in batches.
* ./spec/support/stubs/dataset_stub.rb
  * Move url to credentials
* ./spec/rake/import_dataset_spec.rb
  * make stun dynamic by offset and length
* ./app/models/prompt.rb
  * split expectations into different examples
* Add proper healthcheck for elastic
* Have different elastic db for different envs