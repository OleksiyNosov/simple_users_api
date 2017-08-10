class User < ApplicationRecord
  has_many :books

  validates :email, presence: true
  validates_email_format_of :email
  validates :email, uniqueness: { case_insensitive: true }
end
