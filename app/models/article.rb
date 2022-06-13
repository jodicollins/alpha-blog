class Article < ApplicationRecord
  #automatically gives us getters and setters
  # put validations and constraints here
  validates :title, presence: true, length: { minimum: 6, maximum: 100 }
  validates :description, presence: true, length: { minimum: 10, maximum: 300 }
end  
