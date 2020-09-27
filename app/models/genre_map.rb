class GenreMap < ApplicationRecord
  
  belongs_to :clinic, optional: true
  belongs_to :genre, optional: true
  
end
