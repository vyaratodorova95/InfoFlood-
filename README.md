# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
    ruby '2.6.3'
* Rails version   
    'rails', '~> 6.0.2', '>= 6.0.2.1'

* System dependencies
    Gems
    
    gem 'puma', '~> 4.1'
    gem 'will_paginate'
    gem 'sass-rails', '>= 6'
    gem 'webpacker', '~> 4.0'
    gem 'jquery-rails'
    gem 'bootstrap', '~> 4.4.1'
    gem 'turbolinks', '~> 5'
    gem 'jbuilder', '~> 2.7'
    (not necessary) gem 'redis', '~> 4.0'
    (not necessary) gem 'bcrypt', '~> 3.1.7'
    
    gem 'bootsnap', '>= 1.4.2', require: false
    
    gem 'sqlite3', '~> 1.4'
    gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
    
    gem 'web-console', '>= 3.3.0'
    gem 'listen', '>= 3.0.5', '< 3.2'
    gem 'spring'
    gem 'spring-watcher-listen', '~> 2.0.0'
    
    gem 'capybara', '>= 2.15'
    gem 'selenium-webdriver'
    gem 'webdrivers'
    
    gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
    
    gem 'pg', '1.1.4'
    
    
* Configuration (All commands are in the project dir and in the terminal. If requested to add something to a folder it will be specificly written)

  1.	rails new InfoFlood 
  2.	rails generate controller infoflood index
  3.  Before running rails server, it’s necessary on some systems (including the cloud IDE) to allow connections to the local web server. To enable this, you should navigate to the file config/environments/development.rb and paste in the two extra lines shown
  #Allow connections to local server.
    config.hosts.clear
  4.	Open infoflood/config/routes.rb in your editor. Stop the rails server if you have it running so that changes to the routes file take effect.
    root 'infoflood/index'
  5.	We can check that it works by switching to the other console, and then cd into the travelagent workspace if we’re not already there, and start the server with the command
rails server
  6.	If you want to remove all pluralizations
ActiveSupport::Inflector.inflections do |inflect|
  inflect.clear
inflect.singular(/$/i, '')
  end
  
  7.	rails generate scaffold country name
  8.  rails db:migrate
  9.	rails generate scaffold Information long:decimal lat:decimal area:integer began:date ended:date dead:integer displaced:integer maincause:string country:references
  10.	rails db:migrate
  11.	Highcharts
      yarn add highcharts
      yarn add jquery
      yarn add –check files
   12.	rails g task country seed_country
   13.	rails g task country seed_location
   14.	rails g task country seed_information
   15.	yarn add bootstrap
   16.	add gem 'will_paginate'
   17.	yarn add bootstrap jquery popper.js


* Database creation (Commands only/Terminal)
  1. gem 'pg'  
  2. rails generate scaffold country name
  3. rails db:migrate
  4.rails g task country seed_country
  5.rails g task country seed_location
  6.rails g task country seed_information

* Database initialization
  1. rails db:migrate
  2. rails server

* Services (job queues, cache servers, search engines, etc.)
    Highcharts
    1.yarn add highcharts
    2.yarn add jquery
    3.yarn add –check files
    
    Bootstrap
    1. yarn add bootstrap jquery popper.js
    2. open config/webpack/environment.js and add:
const { environment } = require('@rails/webpacker')
const webpack = require('webpack')
	environment.plugins.prepend('Provide',
new webpack.ProvidePlugin({
$: 'jquery/src/jquery',
jQuery: 'jquery/src/jquery',
Popper: ['popper.js', 'default']
})

   3. Go to app/javascript/packs/application.js and add:
import "bootstrap"
import "../stylesheets/application"
document.addEventListener("turbolinks:load", () => {    
    $('[data-toggle="tooltip"]').tooltip()
    $('[data-toggle="tooltip"]').popover()
})

   4.create a directory in app/javascript called stylesheets and add a stylesheet called application.scss. Then open the file and add:
@import "~bootstrap/scss/bootstrap";

   5. check layout view if it contains this link:
<%= javascript_pack_tag 'application', 'data-turbolinks-track': 'reload' %>
Then add above it:
<%= stylesheet_pack_tag 'application', media: 'all', 'data-turbolinks-track': 'reload' %>


* Deployment instructions

* Implementation

* Copyright
InfoFlood 2020 © Copyright Trademark

* License
Use at your own parial

* Terms and Agreement
Under Terms and Agreemments of University of Aberdeen and Software distrubution
