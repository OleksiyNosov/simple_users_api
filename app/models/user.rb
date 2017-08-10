class User < ApplicationRecord
  has_many :books

  validates :email, presence: true
  validates_email_format_of :email
  validates :email, uniqueness: { case_insensitive: true }

  after_create :set_books_counter

  private
  def set_books_counter
    self.books_counter = 0
  end
end
