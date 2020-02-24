require 'csv'
namespace :country do
  desc "TODO"
  task seed_country: :environment do
    #drop the old table data before importing the new stuff
    Country.destroy_all

    CSV.foreach("lib/assets/global-archive-of-flood-events-xls-1.csv", :headers =>true) do |row |
      # puts row.inspect #just so that we know the file's being read

      if !Country.exists?(name: row[2])
        #create new model instances with the data
        Country.create!(
        name: row[2]
        )
      end
    end
end

 task seed_location: :environment do

    #drop the old table data before importing the new stuff
    Location.destroy_all

    CSV.foreach("lib/assets/global-archive-of-flood-events-xls-1.csv", :headers =>true) do |row |
      # puts row.inspect #just so that we know the file's being read
      country_name = row[2]
       

        # puts "country_temp: " + country_temp
        country = Country.where(["name = ?", country_name]).first
        Location.create!(
        
        country_id: country.id,
        long: row[4].to_d,
        lat: row[5].to_d,
        area: row[6].to_d
        )
   end

  end
  task seed_information: :environment do

    #drop the old table data before importing the new stuff
    Information.destroy_all

    CSV.foreach("lib/assets/global-archive-of-flood-events-xls-1.csv", :headers =>true) do |row |
      # puts row.inspect #just so that we know the file's being read
      country_name = row[2]
       

        # puts "country_temp: " + country_temp
        country = Country.where(["name = ?", country_name]).first
        Information.create!(
        country_id: country.id,
        began: row[7],
        ended: row[8],
        validation: row[9],
        dead: row[10],
        displaced: row[11],
        maincause: row[12]
        )
   end
end

task seed_search: :environment do

    #drop the old table data before importing the new stuff
    Search.destroy_all

    CSV.foreach("lib/assets/global-archive-of-flood-events-xls-1.csv", :headers =>true) do |row |
      # puts row.inspect #just so that we know the file's being read
      country_name = row[2]
       

        # puts "country_temp: " + country_temp
        country = Country.where(["name = ?", country_name]).first
        Search.create!(
        country_id: country.id,
        long: row[4],
        lat: row[5],
        area: row[6],
        began: row[7],
        ended: row[8],
        dead: row[10],
        displaced: row[11],
        maincause: row[12]
        )
   end
end
end