class Search < ApplicationRecord
  belongs_to :country
  
  def self.search(term)
    if term
      WHERE("country.name::text LIKE ?","%#{term}%")
    else
      all
    end
  end
end
