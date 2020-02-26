# Global Flood information - InfoFlood :ocean::house:
###### *Developed by - @JoaoCruz20, @Sneha-Sabu, @vyaraodorova95*
### About the application:
This is a Ruby on Rails application based on an open source dataset representing a Global archive of Flood information found on https://data.world/hdx/0cbe9bb4-edda-4ddf-b82f-c5a0f712c236.
The spreadsheet of the dataset needed to be imported into the application using a Parsing method explained in detail at https://github.com/scharlau/parsing which was a guiding tool to parse the CSV of the dataset. This application uses the rake command to import the dataset into the database since it can process large records of data at once. </p>

## Running application
The live application has been deployed on Heroku and can be accessed through the following link:
http://infoflood.herokuapp.com/

## System Requirements 
#### This application has the following system dependencies:
* Ruby version  - ruby '2.6.3'
* Rails version -'rails', '~> 6.0.2', '>= 6.0.2.1'

#### The following are the Gems to be installed in order to run the application with it's existing functionalities:
List 1 | List 2 
------------ | -------------
gem 'puma', '~> 4.1'| gem 'will_paginate'
gem 'sass-rails', '>= 6' | gem 'webpacker', '~> 4.0'
gem 'jquery-rails' | gem 'bootstrap', '~> 4.4.1'
gem 'turbolinks', '~> 5' | gem 'jbuilder', '~> 2.7'
(not necessary) gem 'redis', '~> 4.0' | (not necessary) gem 'bcrypt', '~> 3.1.7'
gem 'bootsnap', '>= 1.4.2', require: false | gem 'sqlite3', '~> 1.4'
gem 'byebug', platforms: [:mri, :mingw, :x64_mingw] | gem 'web-console', '>= 3.3.0'
gem 'listen', '>= 3.0.5', '< 3.2' | gem 'spring'
gem 'spring-watcher-listen', '~> 2.0.0' | gem 'capybara', '>= 2.15'
gem 'selenium-webdriver' | gem 'webdrivers'
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby] | gem 'pg', '1.1.4'

#### Configuration and running the application
Listed below are the requirements to configure the application: (All commands are as per how they are to be written in the terminal. If requested to add something to a folder it will be specificly written):
1. Create a new application using the following command:
  rails new InfoFlood
2. Rails attempts to pluralize singular words while creating scaffolds. If you want to remove all pluralizations add the following code to the /config/initializers/inflections.rb file <br/>
ActiveSupport::Inflector.inflections do |inflect| <br/>
inflect.clear <br/>
inflect.singular(/$/i, '') <br/>
end
3. Create the scaffolds using the following commands:
  * rails generate controller InfoFlood index
  * rails generate scaffold Search long:decimal lat:decimal area:integer began:date ended:date dead:integer displaced:integer    maincause:string country:references
  * rails generate scaffold Location long:decimal lat:decimal area:integer country:references
4. Load the migration file into the database with the command:
  * rails db:migrate
5. Configure the application by editing the /config/routes.rb file by adding the following code below the get line: <br/>
  * root 'info_flood#index'
6. Display the required data using the relevant attribute names on the view files.
7. Before running rails server, it’s necessary on some systems (including the cloud IDE) to allow connections to the local web server. To enable this, you should navigate to the file config/environments/development.rb and paste in the two extra lines shown <br/>
  #Allow connections to local server. <br/>
 config.hosts.clear
8.Check that the application works by switching to the console and start the server with the command
* rails server

        	<li>Highcharts </li>
	<li>yarn add highcharts </li>
	<li>yarn add jquery</li>
	<li>yarn add –check files</li>
	<li>rails g task country seed_country</li>
	<li>rails g task country seed_location</li>
	<li>rails g task country seed_information</li>
	<li>yarn add bootstrap</li>
	<li>add gem 'will_paginate' </li>
	<li>yarn add bootstrap jquery popper.js</li> </ul>

<h4> Database creation (Commands only/Terminal) </h4>
  <ul>
	<li>gem 'pg'  </li>
	<li>rails generate scaffold country name </li>
	<li>rails generate scaffold Search long:decimal lat:decimal area:integer began:date ended:date dead:integer displaced:integer maincause:string country:references </li>
	<li>rails db:migrate </li>
	<li>rails g task country seed_country</li>
	<li>rails g task country seed_location</li>
	<li>rails g task country seed_information</li>
	

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
