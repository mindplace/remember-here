class User < ApplicationRecord
  has_many :lists
  has_many :list_items
  has_many :places, through: :list_items

  # Attributes
  # username, email, password
  validates_presence_of :username, :password
  validates_presence_of :email, on: :create
  validates :username, uniqueness: true
  has_secure_password

  validate :is_valid_email, on: :create

  private

  def is_valid_email
    unless email.match(/\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i)
      self.errors[:email].push("Not a valid email address: should resemble 'user@example.com'")
    end
  end

end
