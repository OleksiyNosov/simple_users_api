class Book < ApplicationRecord
  belongs_to :user

  validates :title, :author, :user_id, presence: true

  before_create :set_default_year

  after_commit :refresh_book_counter, on: :create

  private
  def set_default_year
    self.year ||= Time.now.year
  end 

  def refresh_book_counter
    CounterBookJob.perform_later user.id
  end
end
