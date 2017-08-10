class Book < ApplicationRecord
  belongs_to :user

  validates :title, :author, :user_id, presence: true

  before_create :set_default_year

  after_create :refresh_book_counter

  private
  def set_default_year
    self.year ||= Time.now.year
  end 

  def refresh_book_counter
    CounterBookJob.refresh_later user.id
  end
end
