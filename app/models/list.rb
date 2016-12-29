class List < ApplicationRecord
  belongs_to :user
  has_many :list_places
  has_many :places, through: :list_places

  # Attributes:
  # Title, description

  validates_presence_of :title
end
