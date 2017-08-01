class Book < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :author, presence: true
  validates :user_id, presence: true

  after_create :set_default_year

  private
  def set_default_year
    self.year ||= Time.now.year
  end 
end
