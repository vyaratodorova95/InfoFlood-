require 'csv'
namespace :country do
  desc "pull country data into database"
  task seed_country: :environment do

    #drop the old table data before importing the new stuff
    Country.destroy_all

    CSV.foreach("lib/assets/Country1.csv", :headers =>true) do |row |
      puts row.inspect #just so that we know the file's being read

      #create new model instances with the data
      Country.create!(
      name: row[0]
    )
    end
  end
  
   task seed_location: :environment do

    #drop the old table data before importing the new stuff
    Location.destroy_all

    CSV.foreach("lib/assets/TEST.csv", :headers =>true) do |row |
      puts row.inspect #just so that we know the file's being read

      #create new model instances with the data
      Location.create!(
      country_id: row[0].to_i,
      long: row[1].to_d,
      lat: row[2].to_d,
      area: row[3].to_d
    
    )
    end
  end

end