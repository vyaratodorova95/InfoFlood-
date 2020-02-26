class Search < ApplicationRecord
  belongs_to :country
  
  def self.search(term)
    if term
      where("country.name LIKE ?","%#{term}%")
    else
      all
    end
  end
end
