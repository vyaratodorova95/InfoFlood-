class Search < ApplicationRecord
  belongs_to :country
  
  def self.search(term)
    
      WHERE("country.name::text LIKE ?","%#{term}%")
  
  end
end
