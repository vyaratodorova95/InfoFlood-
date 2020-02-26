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
8. Check that the application works by switching to the console and start the server with the command
* rails server

 #### Charts
 * Highcharts are used for generating interactive charts and graphs representing the Top 5 most affected and Top 10 least flood affected countries on the Statistics page of the application to provide the user with an insight based on the cumulative dataset. The charts have been generated following the instructions at the bottom of the page on https://homepages.abdn.ac.uk/b.scharlau/pages/practical-three-adding-models-to-the-travel-agent/. The charts displayed accurate counts of total number of floods recorded per country on github, however due to the database being different on Heroku faced some compatibility issues in terms of accurate counts.\
Following steps are to be taken to install and run the highcharts on the application:
* yarn add highcharts
* yarn add jquery
* yarn add –check files

#### Dataset importing with Rake file
To start developing the application in order to display the data the following steps have to be taken:
* rails g task country seed_country
* Running the above command will create a file under lib/tasks/country.rake which can be modified by specifying tasks and details of each database table and the column names to be inserted in each table from the excel.

Run the following three commands one by one to import data into each table:
* rails g task country seed_country
* rails g task country seed_location
* rails g task country seed_search

#### Maps
This application uses Mapbox with Leaflet for displaying locations of each recorded Flood.

#### Layout and Bootstrap integration
The following steps have to be taken in order to integrate Bootstrap into the layout of the application:
* yarn add bootstrap
* yarn add bootstrap jquery popper.js
* Open config/webpack/environment.js and add:\
const { environment } = require('@rails/webpacker')\
const webpack = require('webpack')\
environment.plugins.prepend('Provide',\
new webpack.ProvidePlugin({\
$: 'jquery/src/jquery',\
jQuery: 'jquery/src/jquery',\
Popper: ['popper.js', 'default']\
})
* Go to app/javascript/packs/application.js and add:\
import "bootstrap"\
import "../stylesheets/application"\
document.addEventListener("turbolinks:load", () => {    
    $('[data-toggle="tooltip"]').tooltip()\
    $('[data-toggle="tooltip"]').popover()\
})
* Create a directory in app/javascript called stylesheets and add a stylesheet called application.scss. Then open the file and add:\
@import "~bootstrap/scss/bootstrap";
* Check layout view if it contains this link:\
<%= javascript_pack_tag 'application', 'data-turbolinks-track': 'reload' %>
Then add above it:\
<%= stylesheet_pack_tag 'application', media: 'all', 'data-turbolinks-track': 'reload' %>


#### Application pages - Layouts
 
1.	This is our homepage background photo
![Homepage](https://github.com/vyaraodorova95/InfoFlood-/blob/master/app/assets/images/Print1.png)

2. Photo displaying the impact of floods
![Homepage](https://github.com/vyaraodorova95/InfoFlood-/blob/master/app/assets/images/Print2.png)
 
3. A video documenting the impact of floods in Kerala, India
![Homepage](https://github.com/vyaraodorova95/InfoFlood-/blob/master/app/assets/images/Print3.png)
 
4. A bar graph which displays 20 countries and the number of places within them affected by floods.\
**Comment: Prior to deploying our application on Heroku, on our Github master branch the following bar graph displayed accurate individual counts of floods in each country. Following the deployment of our application to Heroku, we have encountered a compatability issue with displaying the accurate total counts of floods within the bar graph.**
![Homepage](https://github.com/vyaraodorova95/InfoFlood-/blob/master/app/assets/images/Print4.png)

5. The first pie chart shown displays the countries with the highest number of floods and the second one shows top 10 counries least affected by floods.
![Homepage](https://github.com/vyaraodorova95/InfoFlood-/blob/master/app/assets/images/Print5.png)

6. Our search page includes a chronological information of floods around the world and there is a search bar which enables users to find more information about flood events by country.\ 
**Comments: Prior to deploying our application to Heroku, on our Github master branch the search functionality returned query results of keyword search (countries). Following the deployment of our application to Heroku, we have encountered an issue with the functionality of the search bar displaying the query results.** 
![Homepage](https://github.com/vyaraodorova95/InfoFlood-/blob/master/app/assets/images/Print6.png)

 
7. This is a map which displays the location of a flood along with the start and end date, number of deaths and cause of the event.
![Homepage](https://github.com/vyaraodorova95/InfoFlood-/blob/master/app/assets/images/Print7.png)

8. This is a page that returns the country specific flood details of each location as a JSON format.
![Homepage](https://github.com/vyaraodorova95/InfoFlood-/blob/master/app/assets/images/Print8.png)



#### Deployment instructions



*InfoFlood 2020 © Copyright*
*Under Terms and Agreemments of University of Aberdeen and Software distrubution*
