class ListPlace < ApplicationRecord
  belongs_to :list
  belongs_to :place

  # Attributes:
  # notes

  def title
    self.place.try(:title)
  end

  def title=(new_title)
    if self.place
      self.place.title = new_title
    end
  end

  def address
    self.place.try(:address)
  end

  def address=(new_address)
    if self.place
      self.place.address = new_address
    end
  end

  def website
    self.place.try(:website)
  end

  def website=(new_website)
    if self.place
      self.place.website = new_website
    end
  end

end
