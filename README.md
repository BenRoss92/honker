# Honker

## Overview

Honker is a mini Twitter clone that allows users to "honk" (i.e. yell arrogantly at each other) and displays their messages on a shared page.

## Instructions

You can view the app online at https://honks.herokuapp.com/.

You can also run the app locally on the command line by doing the following:

1. Clone and open this repository - `$ git clone git@github.com:BenRoss92/honker.git && cd honker`
2. Install RVM (Ruby Version Manager) - https://rvm.io/rvm/install
3. Install Bundler version 2.0.1 (same version used for Heroku site) - `$ gem install bundler -v 2.0.1`
4. Install the dependencies - `$ bundle install`
5. Install PostgreSQL - https://www.postgresql.org/download/
6. Create PostgreSQL databases for the 'test' and 'development' environments:
```
# Enter PostgreSQL:
$ psql
# Create a test database:
postgres=# CREATE DATABASE honker_test;
# Create a development database:
postgres=# CREATE DATABASE honker_development;
# Quit PostgreSQL:
postgres=# \q
```
5. Run the tests using `$ bundle exec rspec`
6. Run the app using `$ bundle exec rackup`, then visit http://localhost:9292 in a browser

## User stories

>As a User  
So that I can post honks on Honker as me  
I want to sign up for Honker

>As a User  
So that I can post honks on Honker as me  
I want to log in to Honker

>As a User  
So that I can avoid others posting honks on Honker as me  
I want to log out of Honker

>As a User  
So that I can let people know what I am doing  
I want to send a honk on Honker

>As a User  
So that I can see what others are honking,  
I want to see all honks in reverse chronological order

>As a User  
So that I know the context of a honk  
I want to see the time at which it was made
