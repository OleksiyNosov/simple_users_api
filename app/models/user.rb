class User < ApplicationRecord
  has_many :books

  validates :email, presence: true, uniqueness: { case_sensitive: false }, email_format: { message: 'is not valid' }
end
