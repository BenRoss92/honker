# Honker

## Overview

Honker is a mini Twitter clone that allows users to 'honk' (i.e. post/shout messages in capitals) to a public stream.

## Instructions

You can view the app online at https://honks.herokuapp.com/, or run it locally:

1. Clone and open this repository - `$ git clone git@github.com:BenRoss92/honker.git && cd honker`
2. Install gems - `$ bundle install`
3. Install PostgreSQL database - (instructions for Mac installation using Homebrew:) http://exponential.io/blog/2015/02/21/install-postgresql-on-mac-os-x-via-brew/
4. Create test and development databases:
```
# Enter PostgreSQL:
$ psql
# Create test database:
postgres=# CREATE DATABASE honker_test;
# Create development database:
postgres=# CREATE DATABASE honker_development;
# Quit:
postgres=# \q
```
5. Run tests using `$ bundle exec rspec`
6. Run the app using `$ bundle exec rackup`, then open a browser page with URL http://localhost:9292

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
