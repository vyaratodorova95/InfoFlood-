# README

<h1>About the application:</h1>
<p>This is a Ruby on Rails application based on an open source dataset based on a Global archive of Flood information found at ___
The spreadsheet needed to be imported into the application using a Parsing method explained in detail at https://github.com/scharlau/parsing which was a guiding tool to parse the CSV of the dataset. This application uses the rake command to import the dataset into the database since it can process large records of datasets at once. </p>

<h1>Running application </h1>
<p> </p>

<h1> </h1>
<h1> System Requirements </h1>
<p> This application has the following system dependencies:</p>
<ul>
	<li>Ruby version  - ruby '2.6.3' </li>
	<li>Rails version -'rails', '~> 6.0.2', '>= 6.0.2.1' </li>
</ul>
   
<h4>The following are the Gems to be installed in order to run the application with it's existing functionalities: </h4>
<ul>
	<li> gem 'puma', '~> 4.1' </li>
	<li> gem 'will_paginate' </li>
	<li> gem 'sass-rails', '>= 6' </li>
	<li> gem 'webpacker', '~> 4.0' </li>
	<li> gem 'jquery-rails' </li>
	<li> gem 'bootstrap', '~> 4.4.1' </li>
	<li> gem 'turbolinks', '~> 5' </li>
	<li> gem 'jbuilder', '~> 2.7' </li>
	<li> (not necessary) gem 'redis', '~> 4.0' </li>
	<li> (not necessary) gem 'bcrypt', '~> 3.1.7' </li>
	<li> gem 'bootsnap', '>= 1.4.2', require: false </li>
	<li> gem 'sqlite3', '~> 1.4' </li>
	<li> gem 'byebug', platforms: [:mri, :mingw, :x64_mingw] </li>
	<li> gem 'web-console', '>= 3.3.0' </li>
	<li> gem 'listen', '>= 3.0.5', '< 3.2' </li>
	<li> gem 'spring' </li>
	<li> gem 'spring-watcher-listen', '~> 2.0.0' </li>
	<li> gem 'capybara', '>= 2.15' </li>
	<li> gem 'selenium-webdriver' </li>
	<li> gem 'webdrivers' </li>
	<li> gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby] </li>
	<li> gem 'pg', '1.1.4' </li>
</ul>	
    
<h4>Configuration </h4>    
<p>The follow are requirements to configure the application:  (All commands are as per how they are to be written in the project directory and in the terminal. If requested to add something to a folder it will be specificly written)
<ul>
	<li> rails new InfoFlood </li>
	<li> rails generate controller InfoFlood index </li>
	<li> Before running rails server, it’s necessary on some systems (including the cloud IDE) to allow connections to the local web server. To enable this, you should navigate to the file config/environments/development.rb and paste in the two extra lines shown <br/>
  #Allow connections to local server. <br/>
 config.hosts.clear </li>
  	<li>Open infoflood/config/routes.rb in your editor. Stop the rails server if you have it running so that changes to the routes file take effect. <br/>
	  root 'infoflood/index' </li>
  	<li>We can check that it works by switching to the other console, and then cd into the travelagent workspace if we’re not already there, and start the server with the command <br/>
		rails server </li>
        <li>Rails attempts to pluralize singular words while creating scaffolds. If you want to remove all pluralizations add the following code to the /config/initializers/inflections.rb file <br/>
ActiveSupport::Inflector.inflections do |inflect| <br/>
  inflect.clear <br/>
inflect.singular(/$/i, '') <br/>
		end </li>
	<li>rails generate scaffold country name </li>
	<li>rails db:migrate</li>
  	<li>rails generate scaffold Information long:decimal lat:decimal area:integer began:date ended:date dead:integer displaced:integer maincause:string country:references</li>
	<li>rails db:migrate</li>
	<li>Highcharts </li>
	<li>yarn add highcharts </li>
	<li>yarn add jquery</li>
	<li>yarn add –check files</li>
	<li>rails g task country seed_country</li>
	<li>rails g task country seed_location</li>
	<li>rails g task country seed_information</li>
	<li>yarn add bootstrap</li>
	<li>add gem 'will_paginate' </li>
	<li>yarn add bootstrap jquery popper.js</li>

<p> Database creation (Commands only/Terminal) </p>
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
