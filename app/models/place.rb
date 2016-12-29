class Place < ApplicationRecord
  has_many :list_places
  has_many :lists, through: :list_places

  # Attributes:
  # title, address, website
  
  validates_presence_of :title, :address

end
